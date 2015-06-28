#ifndef COMPASSANGLE_H
#define COMPASSANGLE_H

#include <QString>


class Compassangle
{
private:
   QString m_fullangleStr;
   double m_fullangle;
   double m_angle;
   double m_fractPart;
   double m_last;
   double m_last2;
   double m_coef_A;
   double m_skl;
   double m_lastAngle;
   double m_lastAngle1;
   int m_tmCourse;
   int index;
   int m_con;
   int m_con1;
public:
    Compassangle(double, double, double);
    ~Compassangle();

    QString getM_fullangleStr()
    {
        return m_fullangleStr;
    }

    void setM_fullangle(double fullangle)
    {
        m_fullangle = fullangle;
    }

    double getM_fullangle()
    {
        return m_fullangle;
    }

    void setM_angle(double angle)
    {
        m_angle = angle;
    }

    double getM_angle()
    {
        return m_angle;
    }

    void setM_fractPart(double fractPart)
    {
        m_fractPart = fractPart;
    }

    double getM_fractPart()
    {
        return m_fractPart;
    }
};

#endif // COMPASSANGLE_H
