#include "settings.h"
#include "ui_settings.h"

Settings::Settings(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::Settings)
{
    ui->setupUi(this);
    ui->Interface_c->setCurrentIndex(0);
    foreach (QSerialPortInfo info, QSerialPortInfo::availablePorts())
    {
        ui->Com_n->addItems(QStringList(info.portName()));
    }
    ui->speed->setCurrentIndex(3);
    ui->data_bits->setCurrentIndex(3);
    ui->bit_stop->setCurrentIndex(0);
    ui->parity_c->setCurrentIndex(0);
    ui->Com_n->setCurrentIndex(0);
    //m_name_COM=ui->Com_n->currentText();
    m_name_COM = "ttyUSB0";
    //m_name_COM = "COM5";
    m_interface=0;
    m_Baud_rate=9600;
    m_Number_of_data_bits=8;
    m_Stop_bits=1;
    m_Parity=0;

    //QStringList settingsList;
    //settingsList<<m_name_COM<<QString::number(m_Baud_rate)<<QString::number(m_Number_of_data_bits)<<QString::number(m_Stop_bits)<<QString::number(m_Parity);
    //emit settingsChanged(settingsList);
}

Settings::~Settings()
{
    delete ui;
}

void Settings::initSettigs()
{
    QStringList settingsList;
    settingsList<<m_name_COM<<QString::number(m_Baud_rate)<<QString::number(m_Number_of_data_bits)<<QString::number(m_Stop_bits)<<QString::number(m_Parity);
    emit settingsChanged(settingsList);
}

void Settings::on_buttonRevert_clicked()
{
    emit revertRequest();
}

void Settings::setLable(QString msg)
{
    ui->label_Revert->setText(msg);
}

void Settings::on_buttonBox_clicked(QAbstractButton *button)
{
    if(button->text()== "Сохранить все")
    {
        m_interface=ui->Interface_c->currentIndex();
        m_name_COM=ui->Com_n->currentText();
        m_Baud_rate=ui->speed->currentText().toInt();
        m_Number_of_data_bits=ui->data_bits->currentIndex()+5;
        m_Stop_bits=ui->bit_stop->currentIndex()+1;
        if(ui->parity_c->currentIndex() == 0)
        {
            m_Parity=0;
        }
        else
        {
            m_Parity=ui->parity_c->currentIndex()+1;
        }
        QStringList settingsList;
        settingsList<<m_name_COM<<QString::number(m_Baud_rate)<<QString::number(m_Number_of_data_bits)<<QString::number(m_Stop_bits)<<QString::number(m_Parity);
        emit settingsChanged(settingsList);
        close();
    }
    else
    {
        //m_accept = false;
        close();
    }
}

void Settings::on_Interface_c_currentIndexChanged(const QString &arg1)
{
    if(arg1=="RS-232")
    {
        ui->speed->setCurrentIndex(2);
        ui->data_bits->setCurrentIndex(3);
        ui->bit_stop->setCurrentIndex(0);
        ui->parity_c->setCurrentIndex(0);
    }
    else if(arg1=="RS-485")
    {
        ui->speed->setCurrentIndex(3);
        ui->data_bits->setCurrentIndex(0);
        ui->bit_stop->setCurrentIndex(1);
        ui->parity_c->setCurrentIndex(1);
     }
    else if(arg1=="MIL-STD-1553")
     {
        ui->speed->setCurrentIndex(4);
        ui->data_bits->setCurrentIndex(1);
        ui->bit_stop->setCurrentIndex(1);
        ui->parity_c->setCurrentIndex(2);
      }
}
