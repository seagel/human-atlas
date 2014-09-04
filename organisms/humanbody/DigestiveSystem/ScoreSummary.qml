import QtQuick 2.0
import QtQuick.Layouts 1.1

Item {
    id: root
    property string organism
    property string organSystem
    property string responseText

    Rectangle {
        id: diagram
        anchors.fill: parent
        color: "lightsteelblue"
        Layout.fillWidth: true
        Layout.fillHeight: true

        Organs {
            organism: root.organism
            organSystem: root.organSystem

        }

        Text {
            text: "Your Score Summary: " + "\n\n" + root.responseText
            x: 500
            y: 80
        }

    }
}





