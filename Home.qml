import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1

import components 1.0 as Components

Item {
    id: root
    property string organism
    signal selected(var selectedComponent)

    Rectangle {
        anchors.fill: parent
        color: "#55ADAB"
        z: 0
    }

    Text {
        id: headerText

        anchors {
            horizontalCenter: parent.horizontalCenter
            top: parent.top
            topMargin: 90
        }

        font.pointSize: 70
        color: "#ffffff"
        text: "Human Body Atlas"
    }

    Text {
        id: subtitleText
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: parent.top
            topMargin: 210
        }
        font.pointSize: 20
        color: "#ffffff"
        text: "Know how your body works"
    }

    ListView {
        id: organsListView
        anchors {
            top: parent.top
            topMargin: 350
            left: parent.left
            leftMargin: 260
            horizontalCenter: parent.horizontalCenter
        }

        orientation: ListView.Horizontal
        spacing: 30

        delegate: Item {
            height: 150
            width: 150

            Image {
                id: icon
                anchors.fill: parent
                source: image
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    root.selected(componentNameRole)
                }
            }

            Text {
                text: nameRole
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    top: parent.top
                    topMargin: 160
                }
                color: "white"
                font.bold: true
            }
        }
    }

    onOrganismChanged: {
        var organSystemsModel = Qt.createQmlObject("import " + organism + " 1.0; OrganSystems {}", root)
        organsListView.model = organSystemsModel
    }
}
