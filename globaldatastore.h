#ifndef GLOBALDATASTORE_H
#define GLOBALDATASTORE_H

#include <QHash>
#include <QString>
#include <QObject>

class GlobalDataStore : public QObject {
    Q_OBJECT

public:
    GlobalDataStore();
    ~GlobalDataStore();

    Q_INVOKABLE void setOrgan(QString organ, int x, int y);
    Q_INVOKABLE QString getOrgan(QString organ);
    Q_INVOKABLE QString getKeys();
    Q_INVOKABLE void clear();

private:
    QHash<QString, QString> organs;
};

#endif // GLOBALDATASTORE_H
