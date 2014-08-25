import QtQuick 2.0

Item {
    id: root

    Component.onCompleted: {
        var newObject = Qt.createQmlObject("import humanbody 1.0;" +
                                           app.currentOrganSystem + "{}", root);
    }
}
