#include "imagemousearea.h"

#include <QApplication>
#include <QQmlApplicationEngine>
#include <QtQml>
#include <jsonreader.h>
#include <globaldatastore.h>

int main(int argc, char *argv[]) {
    QApplication app(argc, argv);

    qmlRegisterType<ImageMouseArea>("org.swecha.humanatlas", 1, 0, "ImageMouseArea");
    qmlRegisterType<JSONReader>("JSONReader", 1, 0, "JSONReader");

    QQmlApplicationEngine engine;
    GlobalDataStore globalDataStore;

    QDir applicationDir(QApplication::applicationDirPath());
    applicationDir.cd("organisms");
    engine.addImportPath(applicationDir.absolutePath());
    engine.addImportPath("qrc:/components");

    engine.rootContext()->setContextProperty("_organismsDataDirectory", QUrl::fromLocalFile(applicationDir.absolutePath()).toString());
    engine.rootContext()->setContextProperty("_globalDataStore", &globalDataStore);

    engine.load(QUrl(QStringLiteral("qrc:///main.qml")));

    return app.exec();
}
