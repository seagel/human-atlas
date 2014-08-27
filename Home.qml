import QtQuick 2.0
import QtQuick.Controls 1.2

import components 1.0 as Components

Item {
    id: root
    property string organism
    signal selected(var selectedComponent)

    ListView {
        id: organsListView
        anchors { horizontalCenter: parent.horizontalCenter; margins: 10 }
        height: parent.height; width: 300
        spacing: 10

        delegate: Button {
            text: nameRole
            style: Components.ButtonStyle {}
            onClicked: root.selected(componentNameRole)
        }
    }

    onOrganismChanged: {
        var organSystemsModel =
                Qt.createQmlObject("import " + organism + " 1.0; OrganSystems {}", root)
        organsListView.model = organSystemsModel
    }
}
