import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtWebKit 3.0

import components 1.0 as Components

RowLayout {
    id: root
    property string organSystem: "digestive_system"
    anchors.fill: parent

    Rectangle {
        id: diagram
        property string currentOrgan

        color: "lightgreen"
        Layout.fillWidth: true
        Layout.fillHeight: true

        Components.OrganImage {
            id: liverImage
            organSystem: root.organSystem
            organ: "liver"
            x: 50
            y: 70
            z: 1

            onClicked: diagram.currentOrgan = organ
        }

        Components.OrganImage {
            id: intestineImage
            organSystem: root.organSystem
            organ: "intestine"
            x: 120
            y: 90

            onClicked: diagram.currentOrgan = organ
        }
    }

    WebView {
        url: "qrc:///imports/" + liverImage.organism + "/" + liverImage.organSystem + "/" + diagram.currentOrgan + ".html"
        Layout.preferredWidth: 240
        Layout.fillHeight: true
    }
}
