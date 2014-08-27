import QtQuick 2.0
import QtQuick.Controls 1.1
import components 1.0 as Components

import humanbody 1.0

Item {
    id: root
    signal selected(var selectedComponent)

    ListView {
        anchors { horizontalCenter: parent.horizontalCenter; margins: 10 }
        height: parent.height; width: 300
        spacing: 10

        model: OrganSystems {}
        delegate: Button {
            text: nameRole
            style: Components.ButtonStyle {}
            onClicked: root.selected(componentNameRole)
        }
    }
}
