#ifndef JSONREADER_H
#define JSONREADER_H

#include <QObject>
#include <QFile>
#include <QTextStream>

class JSONReader : public QObject {
    Q_OBJECT
public:
    explicit JSONReader(QObject *parent = 0);
    Q_PROPERTY(QString source
               READ source
               WRITE setSource
               NOTIFY sourceChanged)

    Q_INVOKABLE QString read();

    QString source() {
        return jsonFile;
    }

public slots:
    void setSource(const QString& source) {
        jsonFile = source;
    }

signals:
    void sourceChanged(const QString& source);
    void error(const QString& msg);

private:
    QString jsonFile;
};

#endif // JSONREADER_H
