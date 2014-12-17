#include "jsonreader.h"

JSONReader::JSONReader(QObject *parent) : QObject(parent) {}

QString JSONReader::read() {
    jsonFile = jsonFile.replace("file://", "");

    if (jsonFile == "")
        return QString();

    if (jsonFile.isEmpty()) {
        emit error("source is empty");
        return QString();
    }

    QFile file(jsonFile);
    QString fileContent;

    if (file.open(QIODevice::ReadOnly)) {
        QTextStream t(&file);
        fileContent = t.readAll();
        file.close();
    } else {
        emit error("Unable to open the file");
        return QString();
    }

    return fileContent;
}
