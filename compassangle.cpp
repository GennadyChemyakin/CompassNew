#include "compassangle.h"

Compassangle::Compassangle(double fullangle, double angle, double fractPart):
    m_fullangle(fullangle), m_angle(angle), m_fractPart(fractPart), m_last(0), m_last2(0), m_coef_A(0), m_lastAngle(0),
    m_lastAngle1(0), m_tmCourse(0), index(0), m_con(0), m_con1(0)
{
    m_fullangleStr = "000.0";
    m_skl = 0; // here will be another arg from file
}

Compassangle::~Compassangle()
{

}

void Compassangle::setM_fullangle(double a)
{
    if(index++ == 0)
        m_last = a;
    a=m_last+(a-m_last)*0.5;
    m_last=a;

    a = a + m_coef_A;

    if(m_tmCourse)
        a=m_skl+a;

    if(a < 0)
       a += 360;
    if(a > 360)
        a -= 360;

    if (a!=0)
    {
        double temp;
        double *pt=new double;
        temp=QString::number(modf(a,pt)).left(3).toDouble();
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

    m_fractPart=m_last2+(m_fractPart-m_last2)*0.5;
    m_last2=m_fractPart;

    QString strAngle =QString::number(m_fullangle);
    if(m_fullangle - (int)m_fullangle == 0)
        strAngle +=".0";
    if(m_fullangle/10<1)
       strAngle="0"+strAngle;
    if(m_fullangle/100<1)
        strAngle="0"+strAngle;

}
