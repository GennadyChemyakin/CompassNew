#-------------------------------------------------
#
# Project created by QtCreator 2015-01-18T16:22:26
#
#-------------------------------------------------

QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = CompassPort
TEMPLATE = app


SOURCES += main.cpp\
        mainwindow.cpp \
    compassport.cpp \
    compass.cpp

HEADERS  += mainwindow.h \
    compassport.h \
    compass.h

FORMS    += mainwindow.ui
