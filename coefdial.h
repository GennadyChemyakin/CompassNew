#ifndef COEFDIAL_H
#define COEFDIAL_H

#include <QDialog>
#include <QString>

namespace Ui {
class CoefDial;
}

class CoefDial : public QDialog
{
    Q_OBJECT

public:
    explicit CoefDial(QWidget *parent = 0);
    ~CoefDial();

private slots:
    void on_but0_Skl_clicked();

    void on_but1_Skl_clicked();

    void on_but2_Skl_clicked();

    void on_but3_Skl_clicked();

    void on_but4_Skl_clicked();

    void on_but5_Skl_clicked();

    void on_but6_Skl_clicked();

    void on_but7_Skl_clicked();

    void on_but8_Skl_clicked();

    void on_but9_Skl_clicked();

    void on_butDel_skl_clicked();

    void on_butPM_skl_clicked();

private:
    bool changeSkl;
    bool changeDempf;
    bool changeCoeafA;
    QString forInputSkl;
    QString forInputDempf;
    QString forInputCoefA;

    Ui::CoefDial *ui;
};

#endif // COEFDIAL_H
