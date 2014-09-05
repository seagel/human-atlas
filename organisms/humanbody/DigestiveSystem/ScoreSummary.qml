import QtQuick 2.0
import QtQuick.Layouts 1.1

Item {
    id: root
    property string organism
    property string organSystem
    property string responseText

    property variant labelColorSheet

    property int numberQuestions: 0
    property int score: 0

    Rectangle {
        id: diagram
        anchors.fill: parent
        color: "lightsteelblue"
        Layout.fillWidth: true
        Layout.fillHeight: true

        Organs {
            organism: root.organism
            organSystem: root.organSystem
            labelColorSheet: root.labelColorSheet
            displayOrganLabel: true
        }

        Text {
            text: "Your score is: " + root.score + "/" + root.numberQuestions + "\n\n" + root.responseText
            x: 520
            y: 70
        }

    }
}





