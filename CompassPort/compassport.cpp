#include "compassport.h"


CompassPort::CompassPort(QObject *parent) : QObject(parent)
{
    m_angle = m_pitch = m_roll = m_state = 0;
}

CompassPort::~CompassPort()
{

}

void CompassPort::on()
{

    if(!port->isOpen())
    {       
        if (port->open(QIODevice::ReadWrite))
        {
            QSerialPortInfo *info = new QSerialPortInfo(*port);
            qDebug() << "Name        : " << info->portName();
            qDebug() << "Description : " << info->description();
            qDebug() << "Manufacturer: " << info->manufacturer();
            qDebug() << "BaudRate: " << port->baudRate();
            qDebug() << "Parity: " << port->parity();
            qDebug() << "Data bits: " << port->dataBits();
            qDebug() << "Stop Bits: " << port->stopBits();

            m_state=1;
            emit stateChanged();
            qDebug()<<"state = 1 ON";
            qDebug()<<info->portName()<<"opened";
            delete info;
        }
        else
        {
            if(port->isOpen())
                port->close();
            qDebug()<<"Error while opening";
        }
    }
    if(port->isOpen() && port->waitForReadyRead(1000))
    {
        QString data;
        QByteArray ByteArray;
        m_state = 1;
        while(m_state)
        {
            qint64 byteAvail = port->bytesAvailable();
            qApp->processEvents();
            if(byteAvail >=13)
            {
                ByteArray = port->readAll();
                data = data.fromLocal8Bit(ByteArray).trimmed();
                if(ByteArray[3]=='p')
                {
                    QBitArray bitdata(104),two_bytes(16);
                    for(int i = 0,j; i < 104; ++i)
                    {
                        j=i/8;
                        if(j<=13)
                            bitdata[i] = ByteArray[j] & (1 << i%8);
                        else
                            break;
                    }

                    for(int i=40,j=15;i<56&&j>=0;i++,j--){two_bytes[j]=bitdata[i];} //Roll

                    m_roll = Round(toDec(two_bytes,1)*1.41,1);
                    emit rollChanged(m_roll);
                    for(int i=56,j=15;i<72&&j>=0;i++,j--){two_bytes[j]=bitdata[i];} //Pitch

                    m_pitch = Round(toDec(two_bytes,1)*1.41,1);
                    emit pitchChanged(m_pitch);
                    for(int i=72,j=15;i<88&&j>=0;i++,j--){two_bytes[j]=bitdata[i];} //Azimuth

                    m_angle = Round(toDec(two_bytes,0)*1.41,1);
                    emit angleChanged(m_angle);
                    m_state=0;
                    qApp->processEvents();
                }
            }
        }
    }
    else
    {
        qDebug()<<"WaitForReadyRead failed";
        qDebug()<<port->error();
    }
}

void CompassPort::initComp()
{
    emit compStarted();
    QByteArray dataForWrite;
    dataForWrite.insert(0,0x0d);
    dataForWrite.insert(1,0x0a);
    dataForWrite.insert(2,0x7e);
    dataForWrite.insert(3,0x72);
    dataForWrite.insert(4,0x01);
    dataForWrite.insert(5,0x01);
    dataForWrite.insert(6,0x09);
    qDebug()<<dataForWrite;
    if(port->isOpen())
    {
        port->write(dataForWrite,7);
        if(!port->waitForBytesWritten(1000))
        {
            qDebug()<<"Error while writing data";
        }
        while(dial->isVisible())
        {

            if(port->isOpen() && port->waitForReadyRead(1000))
            {

                QString data;
                QByteArray ByteArray;
                qint64 byteAvail = port->bytesAvailable();
                qApp->processEvents();
                if(byteAvail >=19)
                {
                    ByteArray = port->readAll();
                    data = data.fromLocal8Bit(ByteArray).trimmed();
                    if(ByteArray[3]=='r'&& ByteArray[0]=='\r' && ByteArray[1]=='\n' && ByteArray[2]=='~')
                    {
                        QBitArray bitdata(152),one_byte(8);
                        for(int i = 0,j; i < 152; ++i)
                        {
                            j=i/8;
                            if(j<=19)
                                bitdata[i] = ByteArray[j] & (1 << i%8);
                            else
                                break;
                        }

                        for(int i=56,j=7;i<64,j>=0;i++,j--){one_byte[j]=bitdata[i];} qDebug()<<toDecInt(one_byte)<<" "<<one_byte;
                        dial->setBar(7,toDecInt(one_byte));
                        for(int i=64,j=7;i<72,j>=0;i++,j--){one_byte[j]=bitdata[i];} qDebug()<<toDecInt(one_byte)<<" "<<one_byte;
                        dial->setBar(6,toDecInt(one_byte));
                        for(int i=72,j=7;i<80,j>=0;i++,j--){one_byte[j]=bitdata[i];} qDebug()<<toDecInt(one_byte)<<" "<<one_byte;
                        dial->setBar(5,toDecInt(one_byte));
                        for(int i=80,j=7;i<88,j>=0;i++,j--){one_byte[j]=bitdata[i];} qDebug()<<toDecInt(one_byte)<<" "<<one_byte;
                        dial->setBar(4,toDecInt(one_byte));
                        for(int i=88,j=7;i<96,j>=0;i++,j--){one_byte[j]=bitdata[i];} qDebug()<<toDecInt(one_byte)<<" "<<one_byte;
                        dial->setBar(3,toDecInt(one_byte));
                        for(int i=96,j=7;i<104,j>=0;i++,j--){one_byte[j]=bitdata[i];} qDebug()<<toDecInt(one_byte)<<" "<<one_byte;
                        dial->setBar(2,toDecInt(one_byte));
                        for(int i=104,j=7;i<112,j>=0;i++,j--){one_byte[j]=bitdata[i];} qDebug()<<toDecInt(one_byte)<<" "<<one_byte;
                        dial->setBar(1,toDecInt(one_byte));
                        for(int i=112,j=7;i<120,j>=0;i++,j--){one_byte[j]=bitdata[i];} qDebug()<<toDecInt(one_byte)<<" "<<one_byte;
                        dial->setBar(0,toDecInt(one_byte));


                        for(int i=48,j=7;i<56,j>=0;i++,j--){one_byte[j]=bitdata[i];} qDebug()<<"Status"<<toDecInt(one_byte)<<" "<<one_byte;
                        if(toDecInt(one_byte)==1)
                        {
                            dial->setLabel("Success");
                        }
                        else if(toDecInt(one_byte)==0)
                        {
                            dial->setLabel("No error");
                        }
                        else if(toDecInt(one_byte)==2)
                        {
                            dial->setLabel("Compensation Already Started");
                        }
                        else if(toDecInt(one_byte)==3)
                        {
                            dial->setLabel("Compensation Not Started");
                        }
                        else if(toDecInt(one_byte)==4)
                        {
                            dial->setLabel("Compensation Timeout");
                        }
                        else if(toDecInt(one_byte)==5)
                        {
                            dial->setLabel("Compensation Computation Failure");
                        }
                        else if(toDecInt(one_byte)==6)
                        {
                            dial->setLabel("New Computed Parameters No Better");
                        }
                        else if(toDecInt(one_byte)==7)
                        {
                            dial->setLabel("Flash Write Fail");
                        }

                        qApp->processEvents();
                    }

                }
                dataForWrite.insert(5,0x02);
                dataForWrite.insert(6,0x0a);
                port->write(dataForWrite,7);
                if(!port->waitForBytesWritten(1000))
                {
                    qDebug()<<"Error while writing data";
                }
            }
        }
    }
    for(int i=0;i<8;i++)
        dial->setBar(i,0);
}

void CompassPort::revert()
{
    QByteArray dataForWrite;
    dataForWrite.insert(0,0x0d);
    dataForWrite.insert(1,0x0a);
    dataForWrite.insert(2,0x7e);
    dataForWrite.insert(3,0x72);
    dataForWrite.insert(4,0x01);
    dataForWrite.insert(5,0x04);
    dataForWrite.insert(6,0x0c);
    qDebug()<<"Here 1";
    bool receivedMsg = false;

    if(port->isOpen())
    {
        port->write(dataForWrite,7);
        if(!port->waitForBytesWritten(1000))
        {
            qDebug()<<"Error while writing data";
        }
        while(!receivedMsg)
        {

            if(port->isOpen() && port->waitForReadyRead(1000))
            {

                QString data;
                QByteArray ByteArray;
                qint64 byteAvail = port->bytesAvailable();
                qApp->processEvents();
                if(byteAvail >=19)
                {
                    ByteArray = port->readAll();
                    data = data.fromLocal8Bit(ByteArray).trimmed();
                    if(ByteArray[3]=='r'&& ByteArray[0]=='\r' && ByteArray[1]=='\n' && ByteArray[2]=='~')
                    {
                        QBitArray bitdata(152),one_byte(8);
                        for(int i = 0,j; i < 152; ++i)
                        {
                            j=i/8;
                            if(j<=19)
                                bitdata[i] = ByteArray[j] & (1 << i%8);
                            else
                                break;
                        }
                        for(int i=40,j=7;i<48,j>=0;i++,j--){one_byte[j]=bitdata[i];} qDebug()<<"Status"<<toDecInt(one_byte)<<" "<<one_byte;
                        if(toDecInt(one_byte)==0)
                        {
                            settings->setLabel("Compass Compensation Off");
                        }
                        else if(toDecInt(one_byte)==1)
                        {
                            settings->setLabel("Compass Compensation Data Collection");
                        }
                        else if(toDecInt(one_byte)==2)
                        {
                            settings->setLabel("Compass Compensation Computation in Progress");
                        }
                        else if(toDecInt(one_byte)==3)
                        {
                            settings->setLabel("Compass Compensation Procedure Abort");
                        }
                        for(int i=48,j=7;i<56,j>=0;i++,j--){one_byte[j]=bitdata[i];} qDebug()<<"Status"<<toDecInt(one_byte)<<" "<<one_byte;
//                        if(toDecInt(one_byte)==1)
//                        {
//                            settings->setLabel("Success");
//                        }
//                        else if(toDecInt(one_byte)==0)
//                        {
//                            settings->setLabel("No error");
//                        }
//                        else if(toDecInt(one_byte)==2)
//                        {
//                            settings->setLabel("Compensation Already Started");
//                        }
//                        else if(toDecInt(one_byte)==3)
//                        {
//                            settings->setLabel("Compensation Not Started");
//                        }
//                        else if(toDecInt(one_byte)==4)
//                        {
//                            settings->setLabel("Compensation Timeout");
//                        }
//                        else if(toDecInt(one_byte)==5)
//                        {
//                            settings->setLabel("Compensation Computation Failure");
//                        }
//                        else if(toDecInt(one_byte)==6)
//                        {
//                            settings->setLabel("New Computed Parameters No Better");
//                        }
//                        else if(toDecInt(one_byte)==7)
//                        {
//                            settings->setLabel("Flash Write Fail");
//                        }
                        //m_state=0;

                        qApp->processEvents();
                        receivedMsg = true;
                    }
                }
                dataForWrite.insert(5,0x02);
                dataForWrite.insert(6,0x0a);
                port->write(dataForWrite,7);
                if(!port->waitForBytesWritten(1000))
                {
                    qDebug()<<"Error while writing data";
                }
            }
        }
    }
}

void CompassPort::updateSettings(QStringList listOfSettings)
{
    if(port->isOpen())
        port->close();
    port->setPortName(listOfSettings.at(0));
    port->setBaudRate(listOfSettings.at(1));
    port->setDataBits(listOfSettings.at(2));
    port->setStopBits(listOfSettings.at(3));
    port->setParity(listOfSettings.at(4));  
}


double CompassPort::toDec(QBitArray bitdata,int p)
{
    double intpart=0;
    double fractpart=0;
    QBitArray bit1(8),bit2(8);
    bit1.fill(true);
    for(int i=0;i<8;i++)
    {
        bit2[i]=bitdata[i];
    }
    int k=1;
    if((p && bitdata[0]) || (!p && bit2 == bit1))//отрицаетельное число в обратном коде
    {
        bitdata=~bitdata;
        p==1? k=-1:k=1;
    }
    for(int i=0,j=7;i<8 && j>=0;i++,j--)
        intpart+=pow(2,j)*bitdata[i];
    for(int i=8,j=1;i<16 && j<=8;i++,j++)
        fractpart+=1/pow(2,j)*bitdata[i];
    return (intpart+QString::number(fractpart).left(5).toDouble())*k;

}

int CompassPort::toDecInt(QBitArray bitdata)
{
    int res = 0;
    int k=1,s=0;

    if(bitdata[0] == true)
    {
        //bitdata=bitdata - QBitArray(16).setBit(15,true);
        bitdata=~bitdata;
        k=-1;
        s=1;
    }

    for(int i = 0;i < bitdata.size();i++)
    {
        res+=pow(2,i)*bitdata[(bitdata.size()-1)-i];
    }
    return (res+s)*k;
}
