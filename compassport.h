#ifndef COMPASSPORT_H
#define COMPASSPORT_H

#include <QObject>
#include "QtSerialPort/QSerialPort"
#include <QtSerialPort/QSerialPortInfo>
#include "QTimer"
#include "QStringList"
#include <QBitArray>
#include <QtGui>
#include "dialogcomp.h"


class CompassPort : public QObject
{
    Q_OBJECT
signals:
    void angleChanged(double);
    void pitchChanged(double);
    void rollChanged(double);
    void BChanged(double);
    void CChanged(double);
    void ZChanged(double);
    void readyWriteToLog();
    void finished();

    void compStarted();
    void compFinished();

    void timerStart(int);
    void timerStop();

    void dialCompProgressChanged(int,int);
    void dialCompStatusChanged(QString);
    void revertStatusChanged(QString);

public slots:
    void on(); //work with port
    void initComp(); //initiation of compensation
    void revert();//reset
    void stopCompensation();
    QSerialPort* getPort()
    {
        return port;
    }

public:
    explicit CompassPort(QObject *parent = 0);
    ~CompassPort();

private:
    QSerialPort *port; //порт
    QTimer *timer; //таймер для вызова основной функции для работы с портом
    double m_roll, m_pitch, m_angle;
    double m_B;
    double m_C;
    double m_Z;
    bool m_state;
    bool m_compInProgress;
    QTextStream *out;
    QFile *file;
    int index;

private slots:
    void updateSettings(QStringList listOfSettings);
    double toDec(QBitArray,int);
    int toDecInt(QBitArray);
    double Round(double,int);
};

#endif // COMPASSPORT_H
