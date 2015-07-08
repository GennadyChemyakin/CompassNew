#include "compassangle.h"
#include <math.h>
#include <QDebug>

Compassangle::Compassangle(QObject *parent) : QObject(parent), m_fullangle(0), m_angle(0), m_fractPart(0), m_last(0), m_last2(0), m_coef_A(0), m_lastAngle(0),
    m_lastAngle1(0), m_tmCourse(0), index(0), m_con(0), m_con1(0)
{
    m_fullangleStr = "000.0";
    m_skl = 0; // here will be another arg from file
    m_dempf = 5;
    curr_angle_count = 0;
    m_sum = 0;
}

Compassangle::~Compassangle()
{
    deleteLater();
}

void Compassangle::setM_fullangle(double a)
{

    qDebug()<<"a(-1)"<<a;
    if(curr_angle_count++ == m_dempf)
    {

        a = (m_sum + a) / (m_dempf+1);
        m_sum = 0;
        curr_angle_count = 0;

    if(index == 0)
        m_last = a;
    qDebug()<<"a0"<<a;
    if(m_last - a > 180)
        a = m_last + ((a+360) - m_last)*0.5;
    else if(m_last - a < -180)
        a = (m_last-360) + (a - m_last + 360)*0.5;
    else
        a = m_last + (a - m_last)*0.5;
    qDebug()<<"a1"<<a;
    if(a<0)
        a+=360;
     if(a>360)
        a-=360;
    a = Round(a,1);
    m_last=a;
    qDebug()<<"aR"<<a;


    //------------------------------------------
    // МК или ИК
    if(m_tmCourse > 0)
        a = a + m_coef_A;

    // ИК
    if(m_tmCourse > 1)
        a = m_skl + a;

    if(a<0)
        a+=360;
     if(a>360)
        a-=360;
    //------------------------------------------


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


    index = 1;


    // формирование строки lcd панели
    m_fullangleStr = QString::number(m_fullangle);
    if(m_fullangle - (int)m_fullangle == 0)
        m_fullangleStr +=".0";
    if(m_fullangle / 10 < 1)
       m_fullangleStr="0"+m_fullangleStr;
    if(m_fullangle / 100 < 1)
        m_fullangleStr="0"+m_fullangleStr;
     qDebug()<<"fullangle"<<m_fullangleStr;
    }
    else
    {
        if(index == 0)
            m_last = a;
        if(m_last - a > 180)
            a = m_last + ((a+360) - m_last)*0.5;
        else if(m_last - a < -180)
            a = (m_last-360) + (a - m_last + 360)*0.5;
        else
            a = m_last + (a - m_last)*0.5;
        if(a<0)
            a+=360;
         if(a>360)
            a-=360;
        a = Round(a,1);
        m_last=a;
        m_sum += a;
        index = 1;

    }
}

double Compassangle::Round(double st,int count)
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

double Compassangle::AbsAngle(double angle, double con)
{
    return angle + 360* con;
}
