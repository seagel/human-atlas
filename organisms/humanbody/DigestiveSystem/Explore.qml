import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtWebKit 3.0

RowLayout {
    id: root
    property string organism
    property string organSystem

    anchors.fill: parent

    Rectangle {
        id: diagram
        property string currentOrgan

        color: "lightgreen"
        Layout.fillWidth: true
        Layout.fillHeight: true

        Organs {
            organism: root.organism
            organSystem: root.organSystem
            onClicked: diagram.currentOrgan = organ
        }
    }

    WebView {
        url: _organismsDataDirectory + "/" + root.organism + "/" + root.organSystem + "/" + diagram.currentOrgan + ".html"
        Layout.preferredWidth: 240
        Layout.fillHeight: true
    }
}
