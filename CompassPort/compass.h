#ifndef COMPASS_H
#define COMPASS_H

#include <QObject>
#include "compassport.h"
#include "QThread"

class Compass : public QObject
{
    Q_OBJECT
public:
    explicit Compass(QObject *parent = 0);
    ~Compass();

signals:
    void angleChanged();
    void pitchChanged();
    void rollChanged();

    void sklChanged();
    void compStarted();
    void afterCommaChanged();
    void trueMagneticCourseChanged();

    void backgroundChanged();
    void infoVisibilityChanged();

    void stateChanged();
    void supplyChanged();
    void connect_stateChanged();
    void connectChanged();

    void menuRequest();



public slots:
    void setAngle(double);
    void setRoll(double);
    void setPitch(double);

private:
    bool m_comp_state;
    bool m_tmCourse;
    double m_dempf;
    double m_coef_A;
    double m_last;
    double m_last2;
    int m_angle;
    double m_fractPart;
    double m_fullangle;
    double m_afterComma;
    int m_state;
    int m_supply;
    int m_connect_state;
    int m_connect;
    int m_background;
    double m_skl;
    double m_savedCourse;
    bool m_savedCourseVisibility;
    double m_pitch;
    double m_roll;
    int m_lastAngle;
    double m_lastAngle1;
    double m_sum;
    int m_con;
    int m_con1;
    int m_temp;
    bool m_infoVisibility;
    double m_summ_ang;



    double Round(double,int);


    CompassPort *compport;
    QThread *portThread;
};

#endif // COMPASS_H
