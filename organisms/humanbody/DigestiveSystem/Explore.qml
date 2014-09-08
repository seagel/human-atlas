import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtWebKit 3.0
import QtMultimedia 5.0

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

        onClicked: {
            root.currentOrgan = organ
            pronunciation.play()
        }
    }

    WebView {

        Audio {
            id: pronunciation
            source:root.currentOrgan + ".wav"
        }

        url: _organismsDataDirectory + "/" + root.organism + "/" + root.organSystem + "/" + root.currentOrgan + ".html"
        Layout.preferredWidth: 240
        Layout.fillHeight: true
    }
}
