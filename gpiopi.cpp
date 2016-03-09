#include "gpiopi.h"

GpioPi::GpioPi(QObject *parent) :
    QObject(parent),pinLed(21),pinAcc(20)
{
    wiringPiSetupGpio();
    pinMode(pinLed,OUTPUT);
    digitalWrite(pinLed,LOW);
    timer = new QTimer();
    connect(timer,SIGNAL(timeout()),this,SLOT(ledOff()));
}

void GpioPi::ledOn(){

    digitalWrite(pinLed,LOW);
    timer->start(200);
}

void GpioPi::ledOff(){
    digitalWrite(pinLed,HIGH);
    timer->stop();
}
