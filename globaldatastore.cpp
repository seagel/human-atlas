#include "globaldatastore.h"

GlobalDataStore::GlobalDataStore() {}

GlobalDataStore::~GlobalDataStore() {}

void GlobalDataStore::setOrgan(QString organ, int x, int y) {
    organs[organ] = QString::number(x) + "," + QString::number(y);
}

QString GlobalDataStore::getOrgan(QString organ) {
    return organs[organ];
}

QString GlobalDataStore::getKeys() {
    QList<QString> keys = organs.keys();
    QString keysString = "";

    for (int i = 0; i < keys.length(); i++)
        keysString += keys[i] + " ";

    return keysString.trimmed();
}

void GlobalDataStore::clear() {
    organs.clear();
}
