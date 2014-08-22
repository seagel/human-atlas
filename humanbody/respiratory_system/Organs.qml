import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtWebKit 3.0

import components 1.0 as Components

Rectangle {
    id: root
    property string currentOrgan
    property string organSystem: "respiratory_system"
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
                id: lungsImage
                organSystem: root.organSystem
                organ: "lungs"
            }
        }

        WebView {
            url: "qrc:///imports/" + lungsImage.organism + "/" + lungsImage.organSystem + "/" + diagram.currentOrgan + ".html"
            Layout.preferredWidth: 240
            Layout.fillHeight: true
        }
    }
}
