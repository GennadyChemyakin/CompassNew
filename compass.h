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
#include "compassangle.h"

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

    Compassangle *compangle;


signals:
    void angleChanged();
    void pitchChanged();
    void rollChanged();

    void compensationLabelChanged();

    void sklChanged(double);
    void coef_AChanged(double);
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
    void closeSettingsViewSignal();

    void revertRequest();


public slots:
    void setAngle(double);
    void setB(double);
    void setC(double);
    void setZ(double);
    void changeDempf()
    {
        if(compangle->getM_dempf() == 0)
            compangle->setM_dempf(5);
        else if(compangle->getM_dempf() == 5)
            compangle->setM_dempf(0);
        context_m->setContextProperty("m_dempf",compangle->getM_dempf());
    }

    void closeSettingsView()
    {
        emit closeSettingsViewSignal();
        qDebug()<<"timeout";
    }

    int getTMKCourse()
    {
        return compangle->getM_tmCourse();
    }

    void revert();
    double angle() const {return m_angle;}
    double getDempf()
    {
        return compangle->getM_dempf();
    }

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
    double getSKL(){
        return m_skl;
    }
    double getA(){
        return m_coef_A;
    }

    void setSKL(double skl){
        m_skl = skl;
    }

    void setA(double a){
        m_coef_A = a;
    }

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
    double getDelta(int num){
        return delta[num-1];
    }
    void addDelta(int, double);
    void addDeltaDegaus(int, double);

    double getDeltaDegaus(int num){
        return deltaDegaus[num-1];
    }
    void startSettingsViewControlTimer(int msec);


protected:
    QObject *qml;


private:
    int k;
    bool m_comp_state;
    double m_dempf;
    bool m_tmCourse;
    double m_coef_A;
    double m_last;
    double m_last2;
    double m_angle;
    double m_fractPart;
    double m_fullangle;
    int m_state;
    int m_connect;
    int m_background;
    double m_skl;
    double m_savedCourse;
    double m_roll;
    double m_pitch;
    double m_afterComma;
    int m_lastAngle;
    double m_lastAngle1;
    double m_sum;
    int m_con;
    int m_con1;
    double m_summ_ang;
    bool m_infoVisibility;
    int m_progress;

    double m_B,m_C,m_Z;
    bool m_writeLog;
    double m_points[25];


    double delta[8];
    double deltaDegaus[8];

    QTime m_oldTime;
    QString skl_str;
    QString a_str;
    QString m_complable;
    QString delta_str;
    QString deltaDegaus_str;



    cubic_spline *spline;

    int index;

    QTextStream *out;
    QFile *file;
    QFile *fileDev;
    QFile * fileSklA;


    Bins m_bins;
    DevCoef m_coef_Dev;


    double Round(double,int);
    void calcPoints();


    CoefDial* dial;
    QTimer *timer;
    QTimer *settingsViewControlTimer;
    CompassPort *compport;
    QThread *portThread;
    DialogComp *dialComp;
    Settings *settingsDialog;



};

#endif // COMPASS_H
