import QtQuick 2.0
import QtQuick.Layouts 1.1

Item {
    id: root
    property string organism
    property string organSystem
    property string responseText
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

        }

        Text {
            text: "Your Score Summary, your score is: " + root.score + "/" + root.numberQuestions +
                  "\n\n" + root.responseText
            x: 500
            y: 80
        }

    }
}





