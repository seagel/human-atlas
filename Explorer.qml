import QtQuick 2.0
import QtQuick.Controls 1.1
import humanbody 1.0

Item {
    id: root
    signal selected(var componentName)

    ListView {
        anchors { fill: parent; margins: 10 }

        model: OrganSystems {}
        delegate: Button {
            text: name
            onClicked: root.selected(componentName)
        }
    }
}
