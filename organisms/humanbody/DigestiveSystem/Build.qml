import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtWebKit 3.0
import QtQuick.Controls 1.2
import QtQuick.LocalStorage 2.0

RowLayout {
    id: root
    property string organism
    property string organSystem
    property string currentOrgan
    property variant coordinatesSheet: {"liver": {"x": 50, "y": 50, "z": 1},
                                       "intestine": {"x": 50, "y": 300},
                                       "stomach": {"x": 50, "y": 200}
                                       }

    anchors.fill: parent

    Organs {
        anchors.fill: parent
        organism: root.organism
        organSystem: root.organSystem
        currentOrgan: root.currentOrgan
        dragOrgans: true
        coordinatesSheet: root.coordinatesSheet
    }


    Rectangle {
        anchors.fill: parent
        border.color: "lightblue"
        anchors.rightMargin: -749
        anchors.bottomMargin: 289
        anchors.leftMargin: 650
        anchors.topMargin: -289
        visible: true

        Text {
            x: 21
            y: 45
            text: "You are draging ..."
        }
    }

    DropArea {
        id: dropFirstOrgan
        width: 116; height: 125

        Rectangle {
            anchors.fill: parent
            border.color: "lightblue"
            anchors.rightMargin: -749
            anchors.bottomMargin: 289
            anchors.leftMargin: 650
            anchors.topMargin: -289
            visible: true

            Text {
                x: 21
                y: 45
                text: "Drop Your First Organ Here"
            }
        }

    }


    DropArea {
        id: dropSecondOrgan
        width: 116; height: 125
        Rectangle {
            anchors.fill: parent
            border.color: "lightblue"
            anchors.rightMargin: -409
            anchors.bottomMargin: 116
            anchors.leftMargin: 310
            anchors.topMargin: -116
            visible: true

            Text {
                x: 13
                y: 49
                text: "Drop Your Second Organ Here"
            }
        }

    }


    DropArea {
        id: dropThirdOrgan
        width: 116; height: 125
        Rectangle {
            anchors.fill: parent
            border.color: "lightblue"
            anchors.rightMargin: -69
            anchors.bottomMargin: -59
            anchors.leftMargin: -30
            anchors.topMargin: 59
            visible: true

            Text {
                x: 20
                y: 51
                text: "Drop Your Third Organ Here"
            }
        }

    }

}
