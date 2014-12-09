import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import QtWebKit 3.0
import QtMultimedia 5.0

import components 1.0 as Components

RowLayout {
    id: root
    property string organism
    property string organSystem
    property string currentOrgan: "mouth"
    property string currentOrganDesc: ""

    anchors.fill: parent

    Organs {
        Layout.fillWidth: true
        Layout.maximumWidth: 400
        Layout.fillHeight: true

        anchors {
            left: parent.left
            leftMargin: 200
        }

        organism: root.organism
        organSystem: root.organSystem
        currentOrgan: root.currentOrgan

        onClicked: {
            root.currentOrgan = organ
            pronunciation.play()
        }

        Button {
            text: "Back"
            style: Components.ButtonStyle {}
            width: 50
            height: 50
            x: 750
            y: 700

            onClicked: {
                stack.push(modeSelection)
            }
        }
    }

    Text {
        Layout.fillWidth: true
        Layout.maximumWidth: 170
        anchors {
            left: parent.left
            top: parent.top
            leftMargin: 800
            topMargin: 50
        }
        text: root.currentOrgan
    }

    Image {
        Layout.fillWidth: true
        Layout.maximumWidth: 170
        anchors {
            left: parent.left
            top: parent.top
            leftMargin: 700
            topMargin: 100
        }
        source: _organismsDataDirectory + "/" + root.organism + "/" + root.organSystem + "/" + root.currentOrgan + ".png"
    }

    Text {
        id: organDesc
        Layout.fillWidth: true
        Layout.maximumWidth: 170
        anchors {
            left: parent.left
            top: parent.top
            leftMargin: 700
            topMargin: 100
        }
        text: root.currentOrganDesc
    }

    Audio {
        id: pronunciation
        source: root.currentOrgan + ".wav"
    }
}
