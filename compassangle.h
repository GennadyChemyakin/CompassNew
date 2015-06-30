#ifndef COMPASSANGLE_H
#define COMPASSANGLE_H

#include <QObject>

class Compassangle : public QObject
{
    Q_OBJECT
public:
    explicit Compassangle(QObject *parent = 0);
    ~Compassangle();

    QString getM_fullangleStr()
    {
        return m_fullangleStr;
    }

    void setM_fullangle(double);

    double getM_fullangle()
    {
        return m_fullangle;
    }

    int getM_tmCourse()
    {
        return m_tmCourse;
    }

    void setM_tmCourse(int arg)
    {
        m_tmCourse = arg;
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

public slots:
   void setM_skl(double skl)
       {
           m_skl = skl;
       }

       void setM_coef_A(double coef_A)
       {
           m_coef_A = coef_A;
       }
};

#endif // COMPASSANGLE_H
