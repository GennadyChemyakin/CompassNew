#include "compassangle.h"
#include <math.h>

Compassangle::Compassangle(QObject *parent) : QObject(parent), m_fullangle(0), m_angle(0), m_fractPart(0), m_last(0), m_last2(0), m_coef_A(0), m_lastAngle(0),
    m_lastAngle1(0), m_tmCourse(0), index(0), m_con(0), m_con1(0)
{
    m_fullangleStr = "000.0";
    m_skl = 0; // here will be another arg from file
}

Compassangle::~Compassangle()
{
    deleteLater();
}

void Compassangle::setM_fullangle(double a)
{
//    //отсеиваем выбросы
//    if(m_last - a > 20)
//        a = m_last;

    //первое вхождение
    if(index == 0)
        m_last = a;


    //сглаживание
    if(fabs(fabs(m_last) - fabs(a)) <20)
        a=m_last+(a-m_last)*0.5;
    m_last=a;

    // МК или ИК
    if(m_tmCourse > 0)
        a = a + m_coef_A;

    // ИК
    if(m_tmCourse > 1)
        a = m_skl + a;

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
        m_fractPart = m_angle = m_fullangle = m_lastAngle = 0;


    // заставляем картушку крутиться в логичном направдении (направление меньшего оборота)
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
    //--------------------------------------------------------------------------------------


    //сглаживание маленькой куртушки
//    if(index == 0)
//        m_last2 = m_fractPart;
//    m_fractPart=m_last2+(m_fractPart-m_last2)*0.5;
//    m_last2=m_fractPart;

    index = 1;


    // формирование строки lcd панели
    m_fullangleStr = QString::number(m_fullangle);
    if(m_fullangle - (int)m_fullangle == 0)
        m_fullangleStr +=".0";
    if(m_fullangle / 10 < 1)
       m_fullangleStr="0"+m_fullangleStr;
    if(m_fullangle / 100 < 1)
        m_fullangleStr="0"+m_fullangleStr;

}
