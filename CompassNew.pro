TEMPLATE = app

QT += qml quick widgets core gui
QT += serialport

SOURCES += main.cpp \
    compass.cpp \
    compassport.cpp \
    coefdial.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    compass.h \
    compassport.h \
    coefdial.h

FORMS += \
    coefdial.ui
