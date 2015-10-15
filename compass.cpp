#include "compass.h"
#include "math.h"

Compass::Compass(QQmlContext *context, QObject *parent) :
    QObject(parent), k(0),m_comp_state(1),m_dempf(2),m_tmCourse(0),m_coef_A(0),
    m_last(0),m_last2(0),m_angle(0),m_fractPart(0),m_fullangle(0),m_state(0),
    m_connect(0),m_background(0),m_skl(0),m_savedCourse(0),m_roll(0),m_pitch(0),
    m_afterComma(0),m_lastAngle(0),m_lastAngle1(0),m_sum(0),m_con(0),m_con1(0),
    m_summ_ang(0),m_infoVisibility(false),m_progress(0),skl_str("0"),a_str("0"),
    m_complable(""),delta_str("0"),deltaDegaus_str("0")
{
    spline = new cubic_spline();

    for(int i=0;i<8;i++)
    {
        delta[i]=0;
        deltaDegaus[i]=0;
        m_points[i] = 0;
        m_points[i+8] = 0;
        m_points[i+16] = 0;

    }
    qDebug()<<QApplication::applicationDirPath();
    fileDev = new QFile(QApplication::applicationDirPath()+"/devCoef");
    fileDev ->open(QFile::ReadOnly);

//    QTextStream* inDev = new QTextStream(fileDev);
//    for (int i=0;i<8;i++)
//        *inDev>>delta[i];
//    fileDev->close();

    delta_str = QString::number(delta[0]);
    //delete inDev;

    fileSklA = new QFile(QApplication::applicationDirPath()+"/SklA");
    fileSklA->open(QFile::ReadOnly);
    QTextStream* inSklA = new QTextStream(fileSklA);
    *inSklA >> m_skl;
    *inSklA >> m_coef_A;
    fileSklA->close();
    skl_str = QString::number(m_skl);
    a_str = QString::number(m_coef_A);

    delete inSklA;

    context_m = context;
    dialComp = new DialogComp();
    compport = new CompassPort();
    timer = new QTimer(this);
    settingsViewControlTimer = new QTimer(this);
    settingsDialog = new Settings();

    //timer signals
    connect(timer, SIGNAL(timeout()),compport, SLOT(on()));
    connect(compport, SIGNAL(timerStart(int)),timer, SLOT(start(int)));
    connect(compport, SIGNAL(timerStop()),timer, SLOT(stop()));

    connect(settingsViewControlTimer,SIGNAL(timeout()),this,SLOT(closeSettingsView()));
    connect(settingsViewControlTimer,SIGNAL(timeout()),settingsViewControlTimer,SLOT(stop()));
    /*//////////////////////////////////////////////////////////////////////////////////////////////////////////////*/

    //angle signals
    connect(compport,SIGNAL(angleChanged(double)),this,SLOT(setAngle(double)));
    connect(compport,SIGNAL(pitchChanged(double)),this,SLOT(setPitch(double)));
    connect(compport,SIGNAL(rollChanged(double)),this,SLOT(setRoll(double)));
    connect(compport,SIGNAL(BChanged(double)),this,SLOT(setB(double)));
    connect(compport,SIGNAL(CChanged(double)),this,SLOT(setC(double)));
    connect(compport,SIGNAL(ZChanged(double)),this,SLOT(setZ(double)));
    connect(compport,SIGNAL(readyWriteToLog()),this,SLOT(writeTolog()));
    /*//////////////////////////////////////////////////////////////////////////////////////////////////////////////*/

    //settings signals
    connect(settingsDialog,SIGNAL(settingsChanged(QStringList)),compport,SLOT(updateSettings(QStringList)));
    connect(settingsDialog,SIGNAL(revertRequest()),compport,SLOT(revert()));
    connect(this,SIGNAL(revertRequest()),compport,SLOT(revert()));
    connect(compport,SIGNAL(revertStatusChanged(QString)),settingsDialog,SLOT(setLable(QString)));
    //connect(compport,SIGNAL(revertStatusChanged(QString)),settingsDialog,SLOT(setCompensationLabel(QString)));
    /*//////////////////////////////////////////////////////////////////////////////////////////////////////////////*/


    compangle = new Compassangle(this);
    //compensation signals
    connect(this,SIGNAL(compensationRequest()),compport,SLOT(initComp()));
    connect(this,SIGNAL(compensationRequest()),this,SLOT(setCompensationLabeltoDeafault()));

    connect(this,SIGNAL(sklChanged(double)),compangle,SLOT(setM_skl(double)));
    connect(this,SIGNAL(coef_AChanged(double)),compangle,SLOT(setM_coef_A(double)));

    //connect(compport,SIGNAL(compStarted()),dialComp,SLOT(show()));
    //connect(compport,SIGNAL(compFinished()),dialComp,SLOT(setBarstoDefault()));
    //connect(compport,SIGNAL(dialCompProgressChanged(int,int)),dialComp,SLOT(setBar(int,int)));
    //connect(compport,SIGNAL(dialCompStatusChanged(QString)),dialComp,SLOT(setLabel(QString)));

    connect(this,SIGNAL(compClosed()),compport,SLOT(stopCompensation()));
    connect(compport,SIGNAL(dialCompProgressChanged(int,int)),this,SLOT(updateCompensationInfo(int,int)));
    connect(compport,SIGNAL(dialCompStatusChanged(QString)),this,SLOT(setCompensationLabel(QString)));
    connect(compport,SIGNAL(revertStatusChanged(QString)),this,SLOT(setCompensationLabel(QString)));
    connect(compport,SIGNAL(compFinished()),this,SLOT(setBarstoDefault()));
    connect(this,SIGNAL(compClosed()),this,SLOT(setCompensationLabeltoDeafault()));
    /*//////////////////////////////////////////////////////////////////////////////////////////////////////////////*/


    portThread = new QThread;
    compport->moveToThread(portThread);
    //compport->getPort()->moveToThread(portThread);
    //connect(portThread,SIGNAL(started()),compport,SLOT(on()));
    connect(compport,SIGNAL(finished()),portThread,SLOT(quit()));
    //connect(compport,SIGNAL(finished()),compport,SLOT(deleteLater()));
    connect(portThread,SIGNAL(finished()),portThread,SLOT(deleteLater()));

    portThread->start();
    settingsDialog->initSettigs();
    timer->start(10);
    //qDebug()<<QThread::currentThreadId();
    context_m->setContextProperty("logMsg","Start write to log");

    context_m->setContextProperty("compass",this);
    //context_m->setContextProperty("compassangle",compangle);

    context_m->setContextProperty("coef_B","0.0");
    context_m->setContextProperty("coef_C","0.0");
    context_m->setContextProperty("coef_Z","0.0");

    context_m->setContextProperty("trueMagneticCourse",compangle->getM_tmCourse());
    context_m->setContextProperty("m_background",m_background);
    context_m->setContextProperty("infoVisibility",m_infoVisibility);

    context_m->setContextProperty("angle_value",compangle->getM_angle());
    context_m->setContextProperty("fract_part",compangle->getM_fractPart());
    context_m->setContextProperty("full_angle",compangle->getM_fullangleStr());
    context_m->setContextProperty("afterComma",m_afterComma);
    context_m->setContextProperty("m_pitch",m_pitch);
    context_m->setContextProperty("m_roll",m_roll);

    context_m->setContextProperty("skl_str",skl_str);
    context_m->setContextProperty("a_str",a_str);
    context_m->setContextProperty("delta_str",delta_str);
    context_m->setContextProperty("deltaDegaus_str",deltaDegaus_str);
    context_m->setContextProperty("m_complable",m_complable);
    context_m->setContextProperty("m_dempf",compangle->getM_dempf());




    file = new QFile("Log, time:"+QTime::currentTime().toString());
    //file->open(QFile::ReadWrite);
    out = new QTextStream(file);
    *out<<"angle  '"<<"roll  '"<<"pitch  '"<<"B  '"<<"C  '"<<"Z  '"<<"Time '\n";
    index = 0;

    addSKL("save");
    addA("save");
    getDevCoef();
    m_skl = 10;
    m_coef_A = 15;
}

Compass::~Compass()
{
    delete compport;
    file->close();
    delete fileDev;
    //delete portThread;
    delete timer;
    delete compangle;

}
void Compass::writeTolog()
{
    *out<<m_fullangle<<"  '"<<m_roll<<"  '"<<m_pitch<<"  '"<<m_B<<"  '"<<m_C<<"  '"<<m_Z<<"  '"<<QTime::currentTime().toString()<<"\n";
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
    emit compensationLabelChanged();
}
void Compass::setCompensationLabeltoDeafault()
{
    m_complable = "";
    context_m->setContextProperty("m_complable",m_complable);
}


void Compass::setAngle(double a)
{

    if(compangle->getM_tmCourse() > 0)
        a = a + spline->f(a);
    compangle->setM_fullangle(a);

    context_m->setContextProperty("fract_part",compangle->getM_fractPart());
    context_m->setContextProperty("full_angle",compangle->getM_fullangleStr());
    context_m->setContextProperty("angle_value",compangle->getM_angle());
}

void Compass::getDevCoef()
{
    fileDev->remove();

    fileDev->open(QFile::WriteOnly);
    QTextStream* outDelta = new QTextStream(fileDev);

    for(int i = 0; i < 8; i++)
    {
        m_coef_Dev.A+=delta[i];
        *outDelta<<delta[i];
        *outDelta<<" ";
    }
    fileDev->close();
    delete outDelta;
    m_coef_Dev.A /= 8;
    m_coef_Dev.B = ((delta[2]-delta[6])/2 + (delta[1]-delta[5])/2 * sqrt(2)/2 + ((delta[3]-delta[7]) * sqrt(2)/2)/2)/2;
    m_coef_Dev.C = ((delta[0]-delta[4])/2 + (delta[1]-delta[5])/2 * sqrt(2)/2 + (delta[3]-delta[7]) * (-sqrt(2)/2)/2)/2;
    m_coef_Dev.D = ((delta[1]+delta[5])/2 - (delta[3]+delta[7])/2)/2;
    m_coef_Dev.E = ((delta[0]+delta[4])/2 - (delta[2]+delta[6])/2)/2;
    calcPoints();
}

void Compass::startSettingsViewControlTimer(int msec)
{
    settingsViewControlTimer->start(msec);
}

void Compass::calcPoints()
{
    double mass[4][12] = {{0.0,0.5,0.87,1.0,0.87,0.5,0.0,-0.5, -0.87,-1.0,-0.87,-0.5},
                         {1.0, 0.87,0.5, 0.0, -0.5,-0.87, -1.0,-0.87,-0.5,0.0, 0.5, 0.87},
                         {0.0,0.26,0.5, 0.71, 0.87, 0.96, 1.0,0.96, 0.87,0.71,0.5, 0.26},
                         {1.0,0.96, 0.87, 0.71,0.5,0.26,0.0,-0.26,-0.5,-0.71,-0.87,-0.96}};

    for(int i = 0; i < 12; i++)
    {
        m_points[i] = m_coef_Dev.D * mass[0][i] + m_coef_Dev.E * mass[1][i] + m_coef_Dev.A + m_coef_Dev.B * mass[2][i] + m_coef_Dev.C * mass[3][i];
        m_points[i+12] = m_coef_Dev.D * mass[0][i] + m_coef_Dev.E * mass[1][i] + m_coef_Dev.A - (m_coef_Dev.B * mass[2][i] + m_coef_Dev.C * mass[3][i]);
    }

    double x[25];
    for(int i = 0; i < 25; i++)
    {
        x[i] = 15 * i;
    }

    m_points[24] = m_points[0];
    spline->build_spline(x,m_points,25);
}

void Compass::setB(double B)
{
    m_B = B;
    QString str;
    if(B-(int)B==0)
        str = QString::number(B) + ".0";
    else
        str = QString::number(B);
    context_m->setContextProperty("coef_B",str);
    return;
}
void Compass::setC(double C)
{
    m_C = C;
    QString str;
    if(C-(int)C==0)
        str = QString::number(C) + ".0";
    else
        str = QString::number(C);

    context_m->setContextProperty("coef_C",str);
    return;
}
void Compass::setZ(double Z)
{
    m_Z = Z;
    QString str;
    if(Z-(int)Z==0)
        str = QString::number(Z) + ".0";
    else
        str = QString::number(Z);
    context_m->setContextProperty("coef_Z",str);
    return;
}

void Compass::addSKL(QString str)
{
    if(skl_str=="0" && (str=="<-" || str=="+/-" || str=="save"))
    {
        fileSklA->remove();
        fileSklA->open(QFile::WriteOnly);
        QTextStream* outSkl = new QTextStream(fileSklA);
        m_skl=skl_str.toDouble();
        *outSkl<<m_skl;
        *outSkl<<" ";
        *outSkl<<m_coef_A;
        *outSkl<<" ";
        fileSklA->close();
        delete outSkl;
        emit sklChanged(m_skl);
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
        fileSklA->remove();
        fileSklA->open(QFile::WriteOnly);
        QTextStream* outSkl = new QTextStream(fileSklA);
        m_skl=skl_str.toDouble();
        *outSkl<<m_skl;
        *outSkl<<" ";
        *outSkl<<m_coef_A;
        *outSkl<<" ";
        fileSklA->close();
        delete outSkl;
        emit sklChanged(m_skl);
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
        if(skl_str.indexOf("+") == 0)
            skl_str.remove(0,1);
        if(skl_str.toInt()<-180)
            skl_str="-180";
        else if(skl_str.toInt()>180)
            skl_str="180";
    }
    context_m->setContextProperty("skl_str",skl_str);

}

void Compass::addDelta(int course, double value)
{
    qDebug()<< "adding delta";
    delta[course-1] = value;
    context_m->setContextProperty("delta_str",delta_str);

}

void Compass::addDeltaDegaus(int course, double value)
{
    deltaDegaus[course-1] = value;
    context_m->setContextProperty("deltaDegaus_str",deltaDegaus_str);

}

void Compass::addA(QString str)
{
    if(a_str=="0" && (str=="<-" || str=="+/-" || str=="save"))
    {
        m_coef_A=a_str.toDouble();
        emit coef_AChanged(m_coef_A);
        return;
    }
    else if(str=="<-" || (a_str=="0" && (str!="+0.1" || str!="-0.1")))
    {
        a_str.remove(a_str.size()-1,1);
        if(str=="<-" && (a_str.isEmpty() || a_str=="-"))
            a_str="0";
    }
    else if(str=="save")
    {
        fileSklA->remove();
        fileSklA->open(QFile::WriteOnly);
        QTextStream* outSkl = new QTextStream(fileSklA);
        m_coef_A=a_str.toDouble();
        *outSkl<<m_skl;
        *outSkl<<" ";
        *outSkl<<m_coef_A;
        *outSkl<<" ";
        fileSklA->close();
        delete outSkl;
        emit coef_AChanged(m_coef_A);
        return;
    }
    else if(str=="+0.1")
    {
        a_str=QString::number(a_str.toDouble()+0.1);
        if(a_str.toDouble()<-10.0)
            a_str="-10";
        else if(a_str.toDouble()>10.0)
            a_str="10";
        context_m->setContextProperty("a_str",a_str);
        return;
    }
    else if(str=="-0.1")
    {
        a_str=QString::number(a_str.toDouble()-0.1);
        if(a_str.toDouble()<-10.0)
                a_str="-10";
            else if(a_str.toDouble()>10.0)
                a_str="10";
        context_m->setContextProperty("a_str",a_str);
        return;
    }
    else if(str=="+/-")
    {
        a_str=QString::number(a_str.toDouble()*-1);
        context_m->setContextProperty("a_str",a_str);
        return;
    }

    if((str.toInt()>=0 || str.toInt()<=9) && str!= "<-")
    {
        if(a_str.indexOf(".")!=-1 && a_str.indexOf(".")!=a_str.size()-1)
            a_str.remove(a_str.size()-1,1);
        a_str+=str;
        if(a_str.indexOf("+") == 0)
            a_str.remove(0,1);
        if(a_str.toInt()<-10)
            a_str="-10";
        else if(a_str.toInt()>10)
            a_str="10";
    }
    context_m->setContextProperty("a_str",a_str);

}

void Compass::setRoll(double st)
{
    m_roll=Round(st,1);
    QString str;
    if(m_roll-(int)m_roll==0)
        str = QString::number(m_roll) + ".0";
    else
        str = QString::number(m_roll);
    context_m->setContextProperty("m_roll",str);
}

void Compass::setPitch(double st)
{
    m_pitch=Round(st,1);
    QString str;
    if(m_pitch-(int)m_pitch==0)
        str = QString::number(m_pitch) + ".0";
    else
        str = QString::number(m_pitch);
    context_m->setContextProperty("m_pitch",str);
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

void Compass::revert()
{
    emit revertRequest();
}

void Compass::changeTrueMagneticCourse()
{
    if(compangle->getM_tmCourse() == 0)
    {
        compangle->setM_tmCourse(1);
        context_m->setContextProperty("trueMagneticCourse",compangle->getM_tmCourse());
    }
    else if(compangle->getM_tmCourse() == 1)
    {
        compangle->setM_tmCourse(2);
        context_m->setContextProperty("trueMagneticCourse",compangle->getM_tmCourse());
    }
    else if(compangle->getM_tmCourse() == 2)
    {
        compangle->setM_tmCourse(0);
        context_m->setContextProperty("trueMagneticCourse",compangle->getM_tmCourse());
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

void Compass::startWriteLog()
{

    if(m_writeLog==0)
    {
        context_m->setContextProperty("logMsg","Stop write to log");
        m_oldTime = QTime::currentTime();
        file->open(QFile::ReadWrite);
        m_writeLog = 1;
    }
    else if(m_writeLog == 1)
    {
        context_m->setContextProperty("logMsg","Start write to log");
        m_writeLog = 0;
        file->close();
        file->rename("Log"+QString::number(k)+ " time:"+m_oldTime.toString());
        delete(file);
        delete(out);
        file = new QFile("Log, time:"+QTime::currentTime().toString());

        out = new QTextStream(file);
        *out<<"angle  '"<<"roll  '"<<"pitch  '"<<"B  '"<<"C  '"<<"Z  '"<<"Time '\n";
        k++;

    }
}
