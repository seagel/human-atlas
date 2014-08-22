#include "imagemousearea.h"

#include <QApplication>
#include <QQmlApplicationEngine>
#include <QtQml>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    qmlRegisterType<ImageMouseArea>("org.swecha.humanatlas", 1, 0, "ImageMouseArea");

    QQmlApplicationEngine engine;
    engine.addImportPath("qrc:/imports");
    engine.addImportPath("qrc:/components");

    engine.load(QUrl(QStringLiteral("qrc:///main.qml")));

    return app.exec();
}
