import QtQuick 2.0
import QtQuick.Controls 1.1

Item {
    id: root

    Component.onCompleted: {
        var newObject = Qt.createQmlObject("import humanbody 1.0;" +
                                           app.currentOrganSystem + "{}", root);
    }
}
