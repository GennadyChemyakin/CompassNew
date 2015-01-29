#include "compass.h"
#include "math.h"

Compass::Compass(QQmlContext *context, QObject *parent) :
    QObject(parent)
{

    m_comp_state=1;
    m_dempf=2;
    m_tmCourse = true;
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

    context_m = context;
    dialComp = new DialogComp();
    compport = new CompassPort();
    timer = new QTimer(this);
    settingsDialog = new Settings();



    connect(timer, SIGNAL(timeout()),compport, SLOT(on()));
    connect(compport, SIGNAL(timerStart(int)),timer, SLOT(start(int)));
    connect(compport, SIGNAL(timerStop()),timer, SLOT(stop()));

    connect(compport,SIGNAL(angleChanged(double)),this,SLOT(setAngle(double)));
    connect(compport,SIGNAL(pitchChanged(double)),this,SLOT(setPitch(double)));
    connect(compport,SIGNAL(rollChanged(double)),this,SLOT(setRoll(double)));

    connect(settingsDialog,SIGNAL(settingsChanged(QStringList)),compport,SLOT(updateSettings(QStringList)));
    connect(settingsDialog,SIGNAL(revertRequest()),compport,SLOT(revert()));
    connect(compport,SIGNAL(revertStatusChanged(QString)),settingsDialog,SLOT(setLable(QString)));

    connect(this,SIGNAL(compensationRequest()),compport,SLOT(initComp()));
    connect(compport,SIGNAL(compStarted()),dialComp,SLOT(show()));
    connect(compport,SIGNAL(compFinished()),dialComp,SLOT(setBarstoDefault()));
    connect(compport,SIGNAL(dialCompProgressChanged(int,int)),dialComp,SLOT(setBar(int,int)));
    connect(compport,SIGNAL(dialCompStatusChanged(QString)),dialComp,SLOT(setLabel(QString)));
    connect(dialComp,SIGNAL(dialClosed()),compport,SLOT(stopCompensation()));


    portThread = new QThread;
    compport->moveToThread(portThread);
    //connect(portThread,SIGNAL(started()),compport,SLOT(on()));
    connect(compport,SIGNAL(finished()),portThread,SLOT(quit()));
    //connect(compport,SIGNAL(finished()),compport,SLOT(deleteLater()));
    connect(portThread,SIGNAL(finished()),portThread,SLOT(deleteLater()));

    portThread->start();
    settingsDialog->initSettigs();
    timer->start(11);
    //qDebug()<<QThread::currentThreadId();

    context_m->setContextProperty("trueMagneticCourse",m_tmCourse);
    context_m->setContextProperty("m_background",m_background);
    context_m->setContextProperty("infoVisibility",m_infoVisibility);
    context_m->setContextProperty("compass",this);
    context_m->setContextProperty("angle_value",m_angle);
    context_m->setContextProperty("fract_part",m_fractPart);
    context_m->setContextProperty("full_angle",m_fullangle);
    context_m->setContextProperty("afterComma",m_afterComma);



}

Compass::~Compass()
{
    delete compport;
    delete portThread;
    delete timer;
}

void Compass::setAngle(double a)
{
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
    m_angle=m_angle-(m_angle-m_last)/(m_dempf*2);
    m_last=m_angle;

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
    m_fractPart=m_fractPart-(m_fractPart-m_last2)/(m_dempf*2);
    m_last2=m_fractPart;
    qApp->processEvents();
    emit angleChanged();

    context_m->setContextProperty("angle_value",m_angle);
    context_m->setContextProperty("fract_part",m_fractPart);
    context_m->setContextProperty("full_angle",m_fullangle);
    context_m->setContextProperty("afterComma",m_afterComma);
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
        m_tmCourse = true;
    }
    else
    {
        m_tmCourse = false;
    }
    context_m->setContextProperty("trueMagneticCourse",m_tmCourse);
}

void Compass::changeBackground()
{
    m_background++;
    if(m_background == 4)
        m_background=0;
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
