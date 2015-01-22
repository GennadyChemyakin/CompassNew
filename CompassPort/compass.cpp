#include "compass.h"

Compass::Compass(QObject *parent) : QObject(parent)
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
    m_supply=0;
    m_connect_state=0;
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



    compport = new CompassPort(this);
    connect(compport,SIGNAL(angleChanged(double),this,SLOT(setAngle(double)));
    connect(compport,SIGNAL(pitchChanged(double)),this,SLOT(setPitch(double)));
    connect(compport,SIGNAL(rollChanged(double)),this,SLOT(setRoll(double)));
    //connect(dialog,SIGNAL(settingChanged(QStringList)),compport,SLOT(updateSettings(QStringList));
    //connect(compport,SIGNAL(compStarted()),compdial,SLOT(show()));

    portThread = new QThread(this);
    compport->moveToThread(portThread);
    connect(portThread,SIGNAL(started()),compport,SLOT(on()));
    connect(compport,SIGNAL(finished()),portThread,SLOT(quit()));
    connect(compport,SIGNAL(finished()),compport,SLOT(deleteLater()));
    connect(portThread,SIGNAL(finished()),portThread,SLOT(deleteLater()));

    portThread->start();

}

Compass::~Compass()
{

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
}

void Compass::setRoll(double st)
{
    m_roll=Round(st,1);
    emit rollChanged();
}

void Compass::setPitch(double st)
{
    m_pitch=Round(st,1);
    emit pitchChanged();
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
