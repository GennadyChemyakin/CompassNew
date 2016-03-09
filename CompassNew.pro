TEMPLATE = app

QT += qml quick widgets core gui
QT += serialport
INCLUDEPATH += /mnt/rasp-pi-rootfs/usr/local/include
LIBS += -L/mnt/rasp-pi-rootfs/usr/local/lib -lwiringPi
SOURCES += main.cpp \
    compass.cpp \
    compassport.cpp \
    coefdial.cpp \
    dialogcomp.cpp \
    settings.cpp \
    cubic_spline.cpp \
    compassangle.cpp \
    gpiopi.cpp

RESOURCES += qml.qrc \
    png.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    compass.h \
    compassport.h \
    coefdial.h \
    dialogcomp.h \
    settings.h \
    cubic_spline.h \
    compassangle.h \
    gpiopi.h

FORMS += \
    coefdial.ui \
    dialogcomp.ui \
    settings.ui
