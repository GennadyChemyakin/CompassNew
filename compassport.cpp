#include "compassport.h"
#include "QDebug"
#include <QThread>

#include "math.h"



CompassPort::CompassPort(QObject *parent) : QObject(parent)
{
    m_angle = m_pitch = m_roll = m_state = 0;
    port = new QSerialPort(this);
    m_compInProgress = false;
    connect(this,SIGNAL(compFinished()),this,SLOT(stopCompensation()));
    file = new QFile("angles");
    file->open(QFile::ReadWrite);
    out = new QTextStream(file);
    index = 0;
}

CompassPort::~CompassPort()
{
    port->close();
    file->close();
    emit finished();
}

void CompassPort::on()
{

    emit timerStop();
    //qDebug()<<QThread::currentThreadId();
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
            qDebug()<<"state = 1 ON";
            qDebug()<<info->portName()<<"opened";
            delete info;
        }
        else
        {
            if(port->isOpen())
                port->close();
            //qDebug()<<"Error while opening";
        }
    }
    if(port->isOpen() && port->waitForReadyRead(100))
    {
        QString data;
        QByteArray ByteArray,ByteArrayStart,ByteArrayFinish;
        bool startFinded = false;

        m_state = 1;

        while(m_state)
        {
            //if(port->waitForReadyRead(1))
            {
                qint64 byteAvail = port->bytesAvailable();
                qApp->processEvents();
                QThread::msleep(9);
                if(byteAvail >=23)
                {
                    ByteArray = port->readAll();
                    data = data.fromLocal8Bit(ByteArray).trimmed();
                    if(ByteArray[3]=='p')
                    {

                        QBitArray bitdata(184),two_bytes(16);
                        for(int i = 0,j; i < 184; ++i)
                        {
                            j=i/8;
                            if(j<=18)
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

                        for(int i=136,j=15;i<1526&&j>=0;i++,j--){two_bytes[j]=bitdata[i];} //coef B
                        m_B = Round(toDec(two_bytes,0)*1.41,1);
                        qDebug()<<"B: "<<m_B;
                        emit BChanged(m_B);

                        for(int i=152,j=15;i<168&&j>=0;i++,j--){two_bytes[j]=bitdata[i];} //coef C
                        m_C = Round(toDec(two_bytes,0)*1.41,1);
                        qDebug()<<"C: "<<m_C;
                        emit CChanged(m_C);

                        for(int i=168,j=15;i<184&&j>=0;i++,j--){two_bytes[j]=bitdata[i];} //coef Z
                        m_Z = Round(toDec(two_bytes,0)*1.41,1);
                        qDebug()<<"Z: "<<m_Z;
                        emit ZChanged(m_Z);

                        //*out << m_angle <<" "<< m_roll<<" "<<m_pitch<<" "<<"1"<<"\n";
                        //*out << index++ <<". "<<m_angle <<"\n";
                        m_state=0;
                        qApp->processEvents();
                    }
                }
                else if(byteAvail >=4 && byteAvail <=23)
                {
                    ByteArray= port->readAll();
                    data = data.fromLocal8Bit(ByteArray).trimmed();
                    if(ByteArray[3]=='p' && startFinded == false)
                    {
                        ByteArrayStart = ByteArray;
                        startFinded = true;

                    }
                    else if(startFinded == true)
                    {
                        ByteArrayFinish += ByteArray;
                        ByteArray = ByteArrayStart + ByteArrayFinish;
                        if(ByteArray.size() >= 23)
                        {
                            QBitArray bitdata(184),two_bytes(16);
                            for(int i = 0,j; i < 184; ++i)
                            {
                                j=i/8;
                                if(j<=23)
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

                            for(int i=136,j=15;i<1526&&j>=0;i++,j--){two_bytes[j]=bitdata[i];} //coef B
                            m_B = Round(toDec(two_bytes,1)*1.41,1);
                            emit BChanged(m_B);

                            for(int i=152,j=15;i<168&&j>=0;i++,j--){two_bytes[j]=bitdata[i];} //coef C
                            m_C = Round(toDec(two_bytes,1)*1.41,1);
                            emit CChanged(m_C);

                            for(int i=168,j=15;i<184&&j>=0;i++,j--){two_bytes[j]=bitdata[i];} //coef Z
                            m_Z = Round(toDec(two_bytes,1)*1.41,1);
                            emit ZChanged(m_Z);
                            emit readyWriteToLog();
                            //*out << m_angle <<" "<< m_roll<<" "<<m_pitch<<" "<<"2"<<"\n";
                            //*out << index++ <<". "<< m_angle <<"\n";

                            m_state=0;
                            startFinded = false;
                        }
                    }
                    //ByteArrayStart="";

                }
            }
        }
    }
    else
    {
        //qDebug()<<"WaitForReadyRead failed";
        //qDebug()<<port->error();
    }
    emit timerStart(10);
}

void CompassPort::initComp()
{
    emit timerStop();
    emit compStarted();
    m_compInProgress = true;
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
        while(m_compInProgress)
        {

            //qDebug()<<"here";
            //qDebug()<<QThread::currentThreadId();
            qApp->processEvents();
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

                        for(int i=56,j=7;i<64 && j>=0;i++,j--){one_byte[j]=bitdata[i];} qDebug()<<toDecInt(one_byte)<<" "<<one_byte;
                        //dial->setBar(7,toDecInt(one_byte));
                        emit dialCompProgressChanged(7,toDecInt(one_byte));
                        for(int i=64,j=7;i<72 && j>=0;i++,j--){one_byte[j]=bitdata[i];} qDebug()<<toDecInt(one_byte)<<" "<<one_byte;
                        //dial->setBar(6,toDecInt(one_byte));
                        emit dialCompProgressChanged(6,toDecInt(one_byte));
                        for(int i=72,j=7;i<80 && j>=0;i++,j--){one_byte[j]=bitdata[i];} qDebug()<<toDecInt(one_byte)<<" "<<one_byte;
                        //dial->setBar(5,toDecInt(one_byte));
                        emit dialCompProgressChanged(5,toDecInt(one_byte));
                        for(int i=80,j=7;i<88 && j>=0;i++,j--){one_byte[j]=bitdata[i];} qDebug()<<toDecInt(one_byte)<<" "<<one_byte;
                        //dial->setBar(4,toDecInt(one_byte));
                        emit dialCompProgressChanged(4,toDecInt(one_byte));
                        for(int i=88,j=7;i<96 && j>=0;i++,j--){one_byte[j]=bitdata[i];} qDebug()<<toDecInt(one_byte)<<" "<<one_byte;
                        //dial->setBar(3,toDecInt(one_byte));
                        emit dialCompProgressChanged(3,toDecInt(one_byte));
                        for(int i=96,j=7;i<104 && j>=0;i++,j--){one_byte[j]=bitdata[i];} qDebug()<<toDecInt(one_byte)<<" "<<one_byte;
                        //dial->setBar(2,toDecInt(one_byte));
                        emit dialCompProgressChanged(2,toDecInt(one_byte));
                        for(int i=104,j=7;i<112 && j>=0;i++,j--){one_byte[j]=bitdata[i];} qDebug()<<toDecInt(one_byte)<<" "<<one_byte;
                        //dial->setBar(1,toDecInt(one_byte));
                        emit dialCompProgressChanged(1,toDecInt(one_byte));
                        for(int i=112,j=7;i<120 && j>=0;i++,j--){one_byte[j]=bitdata[i];} qDebug()<<toDecInt(one_byte)<<" "<<one_byte;
                        //dial->setBar(0,toDecInt(one_byte));
                        emit dialCompProgressChanged(0,toDecInt(one_byte));


                        for(int i=48,j=7;i<56 && j>=0;i++,j--){one_byte[j]=bitdata[i];} qDebug()<<"Status"<<toDecInt(one_byte)<<" "<<one_byte;
                        if(toDecInt(one_byte)==1)
                        {
                            //dial->setLabel("Success");
                            emit dialCompStatusChanged("Success");
                        }
                        else if(toDecInt(one_byte)==0)
                        {
                            //dial->setLabel("No error");
                            emit dialCompStatusChanged("No error");
                        }
                        else if(toDecInt(one_byte)==2)
                        {
                            //dial->setLabel("Compensation Already Started");
                            emit dialCompStatusChanged("Compensation Already Started");
                        }
                        else if(toDecInt(one_byte)==3)
                        {
                            //dial->setLabel("Compensation Not Started");
                            emit dialCompStatusChanged("Compensation Not Started");
                        }
                        else if(toDecInt(one_byte)==4)
                        {
                            //dial->setLabel("Compensation Timeout");
                            emit dialCompStatusChanged("Compensation Timeout");
                        }
                        else if(toDecInt(one_byte)==5)
                        {
                            //dial->setLabel("Compensation Computation Failure");
                            emit dialCompStatusChanged("Compensation Computation Failure");
                        }
                        else if(toDecInt(one_byte)==6)
                        {
                            //dial->setLabel("New Computed Parameters No Better");
                            emit dialCompStatusChanged("New Computed Parameters No Better");
                        }
                        else if(toDecInt(one_byte)==7)
                        {
                            //dial->setLabel("Flash Write Fail");
                            emit dialCompStatusChanged("Flash Write Fail");
                        }

                        qApp->processEvents();
                    }

                }
                dataForWrite.insert(5,0x02);
                dataForWrite.insert(6,0x0a);
                port->write(dataForWrite,7);
                if(!port->waitForBytesWritten(1000))
                {
                    qDebug()<<"Error while writing data during compensation";
                }
            }
        }
    }
    emit compFinished();
    qDebug()<<"finished";
    emit timerStart(10);
}


void CompassPort::stopCompensation()
{
    m_compInProgress = false;
    qDebug()<<"stoped";
}

void CompassPort::revert()
{
    emit timerStop();
    qDebug()<<"revert";
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
                        for(int i=40,j=7;i<48 && j>=0;i++,j--){one_byte[j]=bitdata[i];} qDebug()<<"Status"<<toDecInt(one_byte)<<" "<<one_byte;
                        if(toDecInt(one_byte)==0)
                        {
                            //settings->setLabel("Compass Compensation Off");
                            emit revertStatusChanged("Compass Compensation Off");
                        }
                        else if(toDecInt(one_byte)==1)
                        {
                            //settings->setLabel("Compass Compensation Data Collection");
                            emit revertStatusChanged("Compass Compensation Data Collection");
                        }
                        else if(toDecInt(one_byte)==2)
                        {
                            //settings->setLabel("Compass Compensation Computation in Progress");
                            emit revertStatusChanged("Compass Compensation Computation in Progress");
                        }
                        else if(toDecInt(one_byte)==3)
                        {
                            //settings->setLabel("Compass Compensation Procedure Abort");
                            emit revertStatusChanged("Compass Compensation Procedure Abort");
                        }
                        for(int i=48,j=7;i<56 && j>=0;i++,j--){one_byte[j]=bitdata[i];} qDebug()<<"Status"<<toDecInt(one_byte)<<" "<<one_byte;
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
    emit timerStart(10);
}

void CompassPort::updateSettings(QStringList listOfSettings)
{
    if(port->isOpen())
        port->close();
    port->setPortName(listOfSettings.at(0).toLocal8Bit());
    port->setBaudRate(listOfSettings.at(1).toInt());
    port->setDataBits(QSerialPort::DataBits(listOfSettings.at(2).toInt()));
    port->setStopBits(QSerialPort::StopBits(listOfSettings.at(3).toInt()));
    port->setParity(QSerialPort::Parity(listOfSettings.at(4).toInt()));
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

double CompassPort::Round(double st,int count)
{
    double temp;
    double *pt=new double;
    if(st!=0)
    {
        temp=fabs(modf(st,pt));
        QString str = QString::number(temp),arg="0.";
        if(count<=str.size()+2)
        {
            if(QString(str[count+2]).toInt()<5)
            {
                str=str.left(count+2);
                temp=str.toDouble();
            }
            else
            {
                for(int i=0;i<count-1;i++)
                    arg.push_back("0");
                arg.push_back("1");
                temp+=arg.toDouble();
                temp=QString::number(temp).left(count+2).toDouble();
            }
        }
        return (fabs(*pt)+temp)*(st/fabs(st));
    }
    else return 0;

}
