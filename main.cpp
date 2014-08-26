#include "imagemousearea.h"

#include <QApplication>
#include <QQmlApplicationEngine>
#include <QtQml>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    qmlRegisterType<ImageMouseArea>("org.swecha.humanatlas", 1, 0, "ImageMouseArea");

    QQmlApplicationEngine engine;

    QDir applicationDir(QApplication::applicationDirPath());
    applicationDir.cd("organisms");
    engine.addImportPath(applicationDir.absolutePath());
    engine.addImportPath("qrc:/components");

    engine.rootContext()->setContextProperty("_organismsDataDirectory", QUrl::fromLocalFile(applicationDir.absolutePath()).toString());

    engine.load(QUrl(QStringLiteral("qrc:///main.qml")));

    return app.exec();
}
