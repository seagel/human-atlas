import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtWebKit 3.0

RowLayout {
    id: root
    property string organism
    property string organSystem
    property string currentOrgan

    anchors.fill: parent

    Organs {
        Layout.fillWidth: true
        Layout.fillHeight: true

        organism: root.organism
        organSystem: root.organSystem
        currentOrgan: root.currentOrgan

        onClicked: root.currentOrgan = organ
    }

    WebView {
        url: _organismsDataDirectory + "/" + root.organism + "/" + root.organSystem + "/" + root.currentOrgan + ".html"
        Layout.preferredWidth: 240
        Layout.fillHeight: true
    }
}
