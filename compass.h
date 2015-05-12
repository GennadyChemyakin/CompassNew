#ifndef COMPASS_H
#define COMPASS_H

#include <QObject>
#include <QQmlApplicationEngine>
#include <QTimer>
#include <QApplication>
#include <QDebug>
#include <QQmlContext>
#include <QWinEventNotifier>
#include "compassport.h"
#include "QThread"
#include "coefdial.h"
#include "dialogcomp.h"
#include "settings.h"
#include "cubic_spline.h"

class Compass : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int angle READ angle WRITE setAngle NOTIFY angleChanged)


public:
    explicit Compass(QQmlContext *context, QObject *parent = 0);
    ~Compass();
    QQmlContext *context_m;

    struct Bins
    {
        int bin0,bin1,bin2,bin3,bin4,bin5,bin6,bin7;
        Bins(){bin0=bin1=bin2=bin3=bin4=bin5=bin6=bin7=0;}
    };

    struct DevCoef
    {
        double A,B,C,D,E;
        DevCoef(){A=B=C=D=E=0;}
    };


signals:
    void angleChanged();
    void pitchChanged();
    void rollChanged();

    void sklChanged();
    void coef_AChanged();
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
    void compensationRequest();
    void compClosed();

    void binsChanged();


public slots:
    void setAngle(double);
    void setB(double);
    void setC(double);
    void setZ(double);

    double angle() const {return m_angle;}
    void setBins(Bins bins){m_bins=bins;}
    int getBins(int binNum)
    {
        switch(binNum)
        {
        case 0:
            return m_bins.bin0;
            break;
        case 1:
            return m_bins.bin1;
            break;
        case 2:
            return m_bins.bin2;
            break;
        case 3:
            return m_bins.bin3;
            break;
        case 4:
            return m_bins.bin4;
            break;
        case 5:
            return m_bins.bin5;
            break;
        case 6:
            return m_bins.bin6;
            break;
        case 7:
            return m_bins.bin7;
            break;
        default:
            return 0;
        }
    }
    void getDevCoef();
    void setRoll(double);
    void setPitch(double);
    void changeSkl();
    void initComp();
    void changeTrueMagneticCourse();
    void changeBackground(int);
    void changeInfoScreenVisibility();
    void changeSettings();
    void updateCompensationInfo(int,int);
    void setBarstoDefault();
    void stopComp(){emit compClosed();}
    void setCompensationLabel(QString);
    void setCompensationLabeltoDeafault();
    void addSKL(QString str);
    void addA(QString str);
    void startWriteLog();
    void writeTolog();
    void addDelta(QString,int);
    void addDeltaDegaus(QString,int);

protected:
    QObject *qml;


private:
    double m_B,m_C,m_Z;
    bool m_writeLog;
    double m_points[25];
    bool m_comp_state;
    bool m_tmCourse;
    double m_dempf;
    double m_coef_A;
    double m_last;
    double m_last2;
    double m_angle;
    double m_fractPart;
    double m_fullangle;
    double m_afterComma;
    int m_state;
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
    int m_progress;
    int k;


    double delta[8];
    double deltaDegaus[8];

    QTime m_oldTime;
    QString skl_str;
    QString delta_str;
    QString deltaDegaus_str;
    QString a_str;
    QString m_complable;

    cubic_spline *spline;

    int index;

    QTextStream *out;
    QFile *file;


    Bins m_bins;
    DevCoef m_coef_Dev;


    double Round(double,int);
    void calcPoints();


    CoefDial* dial;
    QTimer *timer;
    CompassPort *compport;
    QThread *portThread;
    DialogComp *dialComp;
    Settings *settingsDialog;


};

#endif // COMPASS_H
