#ifndef COMPASSPORT_H
#define COMPASSPORT_H

#include <QObject>
#include "QtSerialPort/QSerialPort"
#include <QtSerialPort/QSerialPortInfo>
#include "QTimer"
#include "QStringList"

class CompassPort : public QObject
{
    Q_OBJECT
signals:
    void angleChanged(double);
    void pitchChanged(double);
    void rollChanged(double);

    void finished();
    void compStarted();

public slots:
    void on(); //work with port
    void initComp(); //initiation of compensation
    void revert();//reset
public:
    explicit CompassPort(QObject *parent = 0);
    ~CompassPort();

private:
    QSerialPort *port; //порт
    QTimer *timer; //таймер для вызова основной функции для работы с портом
    double m_roll, m_pitch, m_angle;
    bool m_state;
private slots:
    void updateSettings(QStringList listOfSettings);
    double toDec(QBitArray,int);
    int toDecInt(QBitArray);
};

#endif // COMPASSPORT_H
