#include "compass.h"
#include "math.h"

Compass::Compass(QQmlContext *context, QObject *parent) :
    QObject(parent)
{
    m_comp_state=1;
    m_dempf=2;
    m_tmCourse = 0;
    m_coef_A=0;
    m_last=0;
    m_last2=0;
    m_angle=0;
    m_fractPart=0;
    m_fullangle=0;
    m_state=0;
    m_connect=0;
    m_background=0;
    m_skl=0;
    m_savedCourse=0;
    m_roll=0;
    m_pitch=0;
    m_afterComma=0;
    m_lastAngle=0;
    m_lastAngle1=0;
    m_sum=0;
    m_con=0;
    m_con1=0;
    m_summ_ang=0;
    m_infoVisibility=false;
    m_progress=0;
    skl_str="0";
    m_complable="";

    context_m = context;
    dialComp = new DialogComp();
    compport = new CompassPort();
    timer = new QTimer(this);
    settingsDialog = new Settings();


    //timer signals
    connect(timer, SIGNAL(timeout()),compport, SLOT(on()));
    connect(compport, SIGNAL(timerStart(int)),timer, SLOT(start(int)));
    connect(compport, SIGNAL(timerStop()),timer, SLOT(stop()));
    /*//////////////////////////////////////////////////////////////////////////////////////////////////////////////*/

    //angle signals
    connect(compport,SIGNAL(angleChanged(double)),this,SLOT(setAngle(double)));
    connect(compport,SIGNAL(pitchChanged(double)),this,SLOT(setPitch(double)));
    connect(compport,SIGNAL(rollChanged(double)),this,SLOT(setRoll(double)));
    /*//////////////////////////////////////////////////////////////////////////////////////////////////////////////*/

    //settings signals
    connect(settingsDialog,SIGNAL(settingsChanged(QStringList)),compport,SLOT(updateSettings(QStringList)));
    connect(settingsDialog,SIGNAL(revertRequest()),compport,SLOT(revert()));
    connect(compport,SIGNAL(revertStatusChanged(QString)),settingsDialog,SLOT(setLable(QString)));
    /*//////////////////////////////////////////////////////////////////////////////////////////////////////////////*/

    //compensation signals
    connect(this,SIGNAL(compensationRequest()),compport,SLOT(initComp()));
    connect(this,SIGNAL(compensationRequest()),this,SLOT(setCompensationLabeltoDeafault()));

    //connect(compport,SIGNAL(compStarted()),dialComp,SLOT(show()));
    //connect(compport,SIGNAL(compFinished()),dialComp,SLOT(setBarstoDefault()));
    //connect(compport,SIGNAL(dialCompProgressChanged(int,int)),dialComp,SLOT(setBar(int,int)));
    //connect(compport,SIGNAL(dialCompStatusChanged(QString)),dialComp,SLOT(setLabel(QString)));

    connect(this,SIGNAL(compClosed()),compport,SLOT(stopCompensation()));
    connect(compport,SIGNAL(dialCompProgressChanged(int,int)),this,SLOT(updateCompensationInfo(int,int)));
    connect(compport,SIGNAL(dialCompStatusChanged(QString)),this,SLOT(setCompensationLabel(QString)));
    connect(compport,SIGNAL(compFinished()),this,SLOT(setBarstoDefault()));
    connect(this,SIGNAL(compClosed()),this,SLOT(setCompensationLabeltoDeafault()));
    /*//////////////////////////////////////////////////////////////////////////////////////////////////////////////*/


    portThread = new QThread;
    compport->moveToThread(portThread);
    //connect(portThread,SIGNAL(started()),compport,SLOT(on()));
    connect(compport,SIGNAL(finished()),portThread,SLOT(quit()));
    //connect(compport,SIGNAL(finished()),compport,SLOT(deleteLater()));
    connect(portThread,SIGNAL(finished()),portThread,SLOT(deleteLater()));

    portThread->start();
    settingsDialog->initSettigs();
    timer->start(10);
    //qDebug()<<QThread::currentThreadId();

    context_m->setContextProperty("compass",this);

    context_m->setContextProperty("trueMagneticCourse",m_tmCourse);
    context_m->setContextProperty("m_background",m_background);
    context_m->setContextProperty("infoVisibility",m_infoVisibility);

    //context_m->setContextProperty("angle_value",m_angle);
    context_m->setContextProperty("fract_part",m_fractPart);
    context_m->setContextProperty("full_angle",m_fullangle);
    context_m->setContextProperty("afterComma",m_afterComma);
    context_m->setContextProperty("m_pitch",m_pitch);
    context_m->setContextProperty("m_roll",m_roll);

    context_m->setContextProperty("skl_str",skl_str);
    context_m->setContextProperty("m_complable",m_complable);


    //fignay
    /*context_m->setContextProperty("bin0Value",m_progress);
    context_m->setContextProperty("bin1Value",m_progress);
    context_m->setContextProperty("bin2Value",m_progress);
    context_m->setContextProperty("bin3Value",m_progress);
    context_m->setContextProperty("bin4Value",m_progress);
    context_m->setContextProperty("bin5Value",m_progress);
    context_m->setContextProperty("bin6Value",m_progress);
    context_m->setContextProperty("bin7Value",m_progress);*/

    file = new QFile("/home/gennady/anglesAfterSet");
    file->open(QFile::ReadWrite);
    out = new QTextStream(file);
    index = 0;

}

Compass::~Compass()
{
    delete compport;
    file->close();
    //delete portThread;
    delete timer;
}
void Compass::updateCompensationInfo(int binNum, int progress)
{
    m_progress = progress;
    switch(binNum)
    {
    case 0:
        //context_m->setContextProperty("bin0Value",m_progress);
        m_bins.bin0=progress;
        break;
    case 1:
        //context_m->setContextProperty("bin1Value",m_progress);
        m_bins.bin1=progress;
        break;
    case 2:
        //context_m->setContextProperty("bin2Value",m_progress);
        m_bins.bin2=progress;
        break;
    case 3:
        //context_m->setContextProperty("bin3Value",m_progress);
        m_bins.bin3=progress;
        break;
    case 4:
        //context_m->setContextProperty("bin4Value",m_progress);
        m_bins.bin4=progress;
        break;
    case 5:
        //context_m->setContextProperty("bin5Value",m_progress);
        m_bins.bin5=progress;
        break;
    case 6:
        //context_m->setContextProperty("bin6Value",m_progress);
        m_bins.bin6=progress;
        break;
    case 7:
        //context_m->setContextProperty("bin7Value",m_progress);
        m_bins.bin7=progress;
        break;
    }
    emit binsChanged();
}

void Compass::setBarstoDefault()
{
    m_bins.bin0=0;
    m_bins.bin1=0;
    m_bins.bin2=0;
    m_bins.bin3=0;
    m_bins.bin4=0;
    m_bins.bin5=0;
    m_bins.bin6=0;
    m_bins.bin7=0;
    emit binsChanged();
}

void Compass::setCompensationLabel(QString msg)
{
    m_complable = msg;
    context_m->setContextProperty("m_complable",m_complable);
}
void Compass::setCompensationLabeltoDeafault()
{
    m_complable = "";
    context_m->setContextProperty("m_complable",m_complable);
}

void Compass::setAngle(double a)
{
    if(index == 0)
        m_last = a;
    a=m_last+(a-m_last)*0.5;
    m_last=a;

    *out << index++ <<". "<< a <<"\n";

    a = a + m_coef_A;
    if(m_tmCourse)
        a=m_skl+a;
    if(a<0)
       a+=360;
    if(a>360)
        a-=360;
    if (a!=0)
    {
        double temp;
        double *pt=new double;
        temp=QString::number(modf(a,pt)).left(3).toDouble();
        m_afterComma=temp;
        m_fractPart=(QString::number(*pt).right(1).toDouble()+temp)*10;
        m_angle=*pt;
        m_fullangle=m_angle+temp;
    }
    else
        m_afterComma=m_fractPart=m_angle=m_fullangle=m_lastAngle=0;

    if(m_angle-m_lastAngle > 180)
    {
        m_con--;
    }
    else if(m_angle-m_lastAngle < -180)
    {
         m_con++;
    }

    m_lastAngle=m_angle;
    m_angle=m_angle+360*m_con;

    //m_angle=m_last+(m_angle-m_last)*0.7;


    if(m_fractPart-m_lastAngle1 > 50)
    {
        m_con1--;
    }
    else if(m_fractPart-m_lastAngle1 < -50)
    {
         m_con1++;
    }

    m_lastAngle1=m_fractPart;
    m_fractPart=m_fractPart+100*m_con1;

    m_fractPart=m_last2+(m_fractPart-m_last2)*0.7;

    qApp->processEvents();

    //context_m->setContextProperty("angle_value",m_angle);
    //if(!((m_last-m_angle>100) || (m_angle-m_last>100)))
    emit angleChanged();
    context_m->setContextProperty("fract_part",m_fractPart);
    context_m->setContextProperty("full_angle",m_fullangle);
    context_m->setContextProperty("afterComma",m_afterComma);
    //m_last=m_angle;
    m_last2=m_fractPart;
}


void Compass::addSKL(QString str)
{
    if(skl_str=="0" && (str=="<-" || str=="+/-" || str=="save"))
    {
        m_skl=skl_str.toDouble();
        emit sklChanged();
        return;
    }
    else if(str=="<-" || (skl_str=="0" && (str!="+0.1" || str!="-0.1")))
    {
        skl_str.remove(skl_str.size()-1,1);
        if(str=="<-" && (skl_str.isEmpty() || skl_str=="-"))
            skl_str="0";
    }
    else if(str=="save")
    {
        m_skl=skl_str.toDouble();
        emit sklChanged();
        return;
    }
    else if(str=="+0.1")
    {
        skl_str=QString::number(skl_str.toDouble()+0.1);
        if(skl_str.toDouble()<-180.0)
            skl_str="-180";
        else if(skl_str.toDouble()>180.0)
            skl_str="180";
        context_m->setContextProperty("skl_str",skl_str);
        return;
    }
    else if(str=="-0.1")
    {
        skl_str=QString::number(skl_str.toDouble()-0.1);
        if(skl_str.toDouble()<-180.0)
                skl_str="-180";
            else if(skl_str.toDouble()>180.0)
                skl_str="180";
        context_m->setContextProperty("skl_str",skl_str);
        return;
    }
    else if(str=="+/-")
    {
        skl_str=QString::number(skl_str.toDouble()*-1);
        context_m->setContextProperty("skl_str",skl_str);
        return;
    }

    if((str.toInt()>=0 || str.toInt()<=9) && str!= "<-")
    {
        if(skl_str.indexOf(".")!=-1 && skl_str.indexOf(".")!=skl_str.size()-1)
            skl_str.remove(skl_str.size()-1,1);
        skl_str+=str;
        if(skl_str.toInt()<-180)
            skl_str="-180";
        else if(skl_str.toInt()>180)
            skl_str="180";
    }
    context_m->setContextProperty("skl_str",skl_str);

}

void Compass::setRoll(double st)
{
    m_roll=Round(st,1);
    context_m->setContextProperty("m_roll",m_roll);
}

void Compass::setPitch(double st)
{
    m_pitch=Round(st,1);
    context_m->setContextProperty("m_pitch",m_pitch);
}


double Compass::Round(double st,int count)
{
    double temp;
    double *pt=new double;
    if(st!=0)
    {
        temp=fabs(modf(st,pt));
        QString str = QString::number(temp),arg="0.";
        if(count<=str.size()+2)
        {
            if(QString(str[count+2]).toInt()<5)
            {
                str=str.left(count+2);
                temp=str.toDouble();
            }
            else
            {
                for(int i=0;i<count-1;i++)
                    arg.push_back("0");
                arg.push_back("1");
                temp+=arg.toDouble();
                temp=QString::number(temp).left(count+2).toDouble();
            }
        }
        return (fabs(*pt)+temp)*(st/fabs(st));
    }
    else return 0;

}

void Compass::changeSkl()
{
    dial = new CoefDial();
    dial->setModal(true);
    dial->show();
}

void Compass::initComp()
{
    emit compensationRequest();
}

void Compass::changeTrueMagneticCourse()
{
    if(!m_tmCourse)
    {
        context_m->setContextProperty("trueMagneticCourse",1);
        m_tmCourse = true;
    }
    else
    {
        context_m->setContextProperty("trueMagneticCourse",0);
        m_tmCourse = false;
    }
}

void Compass::changeBackground(int num)
{
    m_background=num;
    context_m->setContextProperty("m_background",m_background);
}

void Compass::changeInfoScreenVisibility()
{
    if(!m_infoVisibility)
    {
        m_infoVisibility=true;
    }
    else
    {
        m_infoVisibility=false;
    }
    context_m->setContextProperty("infoVisibility",m_infoVisibility);
}

void Compass::changeSettings()
{
    settingsDialog->exec();
}
