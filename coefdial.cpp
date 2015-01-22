#include "coefdial.h"
#include "ui_coefdial.h"

CoefDial::CoefDial(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::CoefDial)
{
    forInputCoefA = "";
    forInputSkl = "";
    forInputDempf = "";
    changeCoeafA = 0;
    changeSkl = 0;
    changeDempf = 0;
    ui->setupUi(this);
}

CoefDial::~CoefDial()
{
    delete ui;
}

void CoefDial::on_but0_Skl_clicked()
{
    if(forInputSkl == "0")
         forInputSkl = "";
    if ((forInputSkl+"0").toInt() < 180)
    {
        changeSkl = 1;
        forInputSkl+="0";

    }
    else forInputSkl="180";
    ui->inputSkl->setText(forInputSkl);

}

void CoefDial::on_but1_Skl_clicked()
{
       if(forInputSkl == "0")
             forInputSkl = "";
    if ((forInputSkl+"1").toInt() < 180)
    {
        changeSkl = 1;
        forInputSkl+="1";

    }
    else forInputSkl="180";
    ui->inputSkl->setText(forInputSkl);
}

void CoefDial::on_but2_Skl_clicked()
{
    if(forInputSkl == "0")
         forInputSkl = "";
    if ((forInputSkl+"2").toInt() < 180)
    {
        changeSkl = 1;
        forInputSkl+="2";

    }
    else forInputSkl="180";
    ui->inputSkl->setText(forInputSkl);
}

void CoefDial::on_but3_Skl_clicked()
{
    if(forInputSkl == "0")
         forInputSkl = "";
    if ((forInputSkl+"3").toInt() < 180)
    {
        changeSkl = 1;
        forInputSkl+="3";

    }
    else forInputSkl="180";
    ui->inputSkl->setText(forInputSkl);
}

void CoefDial::on_but4_Skl_clicked()
{
    if(forInputSkl == "0")
         forInputSkl = "";
    if ((forInputSkl+"4").toInt() < 180)
    {
        changeSkl = 1;
        forInputSkl+="4";

    }
    else forInputSkl="180";
    ui->inputSkl->setText(forInputSkl);
}

void CoefDial::on_but5_Skl_clicked()
{
    if(forInputSkl == "0")
         forInputSkl = "";
    if ((forInputSkl+"5").toInt() < 180)
    {
        changeSkl = 1;
        forInputSkl+="5";

    }
    else forInputSkl="180";
    ui->inputSkl->setText(forInputSkl);
}

void CoefDial::on_but6_Skl_clicked()
{
    if(forInputSkl == "0")
         forInputSkl = "";
    if ((forInputSkl+"6").toInt() < 180)
    {
        changeSkl = 1;
        forInputSkl+="6";

    }
    else forInputSkl="180";
    ui->inputSkl->setText(forInputSkl);
}

void CoefDial::on_but7_Skl_clicked()
{
    if(forInputSkl == "0")
         forInputSkl = "";
    if ((forInputSkl+"7").toInt() < 180)
    {
        changeSkl = 1;
        forInputSkl+="7";

    }
    else forInputSkl="180";
    ui->inputSkl->setText(forInputSkl);
}

void CoefDial::on_but8_Skl_clicked()
{
    if(forInputSkl == "0")
         forInputSkl = "";
    if ((forInputSkl+"8").toInt() <= 180)
    {
        changeSkl = 1;
        forInputSkl+="8";

    }
    else forInputSkl="180";
    ui->inputSkl->setText(forInputSkl);
}

void CoefDial::on_but9_Skl_clicked()
{
    if(forInputSkl == "0")
         forInputSkl = "";
    if ((forInputSkl+"9").toInt() <= 180)
    {
        changeSkl = 1;
        forInputSkl+="9";

    }
    else forInputSkl="180";
    ui->inputSkl->setText(forInputSkl);
}

void CoefDial::on_butDel_skl_clicked()
{
    changeSkl = 1;
    forInputSkl.remove(forInputSkl.size()-1,1);
    if(forInputSkl == "")
        forInputSkl = "0";
    ui->inputSkl->setText(forInputSkl);
}

void CoefDial::on_butPM_skl_clicked()
{
    changeSkl = 1;
    if(forInputSkl != "0")
       forInputSkl = QString::number(forInputSkl.toInt()*(-1));
    ui->inputSkl->setText(forInputSkl);
}
