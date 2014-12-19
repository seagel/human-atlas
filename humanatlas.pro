TEMPLATE = app

QT += qml quick widgets

SOURCES += main.cpp \
    imagemousearea.cpp \
    jsonreader.cpp \
    globaldatastore.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH = /components

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    imagemousearea.h \
    jsonreader.h \
    globaldatastore.h

CONFIG += c++11
