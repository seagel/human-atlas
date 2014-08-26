import QtQuick 2.0

Item {
    id: root
    property string organism
    property string organSystem

    Component.onCompleted: {
        var newObject = Qt.createQmlObject("import " + organism + " 1.0;" +
                                           organSystem + "{}", root)
        newObject.mode = "explore"
    }
}
