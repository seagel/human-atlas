#include "jsonreader.h"

JSONReader::JSONReader(QObject *parent) : QObject(parent) {}

QString JSONReader::read() {
    if (jsonFile.isEmpty()) {
        emit error("source is empty");
        return QString();
    }

    jsonFile = jsonFile.replace("file://", "");

    QFile file(jsonFile);
    QString fileContent;

    if (file.open(QIODevice::ReadOnly)) {
        QString line;
        QTextStream t(&file);

        do {
            line = t.readLine();
            fileContent += line;
         } while (!line.isNull());

        file.close();
    } else {
        emit error("Unable to open the file");
        return QString();
    }

    return fileContent;
}
