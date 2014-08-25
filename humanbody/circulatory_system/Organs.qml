import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtWebKit 3.0

import components 1.0 as Components

Rectangle {
    id: root
    anchors.fill: parent
    clip: true
    property string currentOrgan
    property string organSystem: "circulatory_system"
    color: "lightsteelblue"

    RowLayout {
        anchors.fill: parent

        Rectangle {
            id: diagram
            property string currentOrgan

            color: "lightsteelblue"
            Layout.fillWidth: true
            Layout.fillHeight: true

            Components.OrganImage {
                id: heartImage
                organSystem: root.organSystem
                organ: "heart"
                x: 120
                y: 90
            }
        }

        WebView {
            url: "qrc:///imports/" + heartImage.organism + "/" + heartImage.organSystem + "/" + diagram.currentOrgan + ".html"
            Layout.preferredWidth: 240
            Layout.fillHeight: true
        }
    }
}
