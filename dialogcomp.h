#ifndef DIALOGCOMP_H
#define DIALOGCOMP_H

#include <QDialog>
#include <QProgressBar>
#include <QCloseEvent>

namespace Ui {
class DialogComp;
}

class DialogComp : public QDialog
{
    Q_OBJECT

public:
    explicit DialogComp(QWidget *parent = 0);
    ~DialogComp();
public slots:
    void setBar(int binNum,int progress);
    void setLabel(QString msg);
    void setBarstoDefault();
signals:
    void dialClosed();
    void barChanged(int,int);
private:
    Ui::DialogComp *ui;
    void closeEvent(QCloseEvent *);
};

#endif // DIALOGCOMP_H
