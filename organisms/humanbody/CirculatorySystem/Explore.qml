import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import QtMultimedia 5.0
import JSONReader 1.0

import components 1.0 as Components

RowLayout {
    id: root
    property string organism
    property string organSystem
    property string currentOrgan: ""
    property string currentOrganDesc: "Click on a organ to see the description"
    property variant organData

    anchors.fill: parent

    JSONReader {
        id: myFile
        source: _organismsDataDirectory + "/" + root.organism + "/" + root.organSystem + "/" + "data.json"
        onError: console.log(msg);
    }

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
            root.currentOrgan = organ;
            root.currentOrganDesc = root.organData[organ].description;
            pronunciation.play();
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

    Component.onCompleted: {
        root.organData = JSON.parse(myFile.read());
    }
}
