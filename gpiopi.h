#ifndef GPIOPI_H
#define GPIOPI_H

#include <QObject>
#include <QTimer>
#include <QDebug>
//#include "wiringPi.h"



class GpioPi : public QObject
{
    Q_OBJECT
    int pinLed;
    int pinAcc;
    QTimer *timer;
public:
    explicit GpioPi(QObject *parent = 0);


signals:

public slots:
void ledOff();
void ledOn();
};

#endif // GPIOPI_H
