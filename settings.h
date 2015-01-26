#ifndef SETTINGS_H
#define SETTINGS_H

#include <QDialog>
#include <QtSerialPort>
#include <QStringList>
#include <QAbstractButton>

namespace Ui {
class Settings;
}

class Settings : public QDialog
{
    Q_OBJECT

public:
    explicit Settings(QWidget *parent = 0);
    ~Settings();

signals:
    void settingsChanged(QStringList);
    void revertRequest();
private slots:
    void on_buttonRevert_clicked();

    void on_buttonBox_clicked(QAbstractButton *button);

    void on_Interface_c_currentIndexChanged(const QString &arg1);

public slots:
    void initSettigs();
    void setLable(QString);

private:
    Ui::Settings *ui;
    QString m_name_COM;
    int m_Baud_rate;
    int m_Number_of_data_bits;
    int m_Stop_bits;
    int m_Parity;
    int m_interface;
};

#endif // SETTINGS_H
