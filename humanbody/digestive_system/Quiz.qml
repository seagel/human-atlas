import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtWebKit 3.0

import components 1.0 as Components

RowLayout {
    id: root
    property string organSystem: "digestive_system"
    property string currentQuizOrgan: "liver"
    property variant organs: ["liver", "intestine", "stomach"]
    property int score: 0

    anchors.fill: parent

    Rectangle {
        id: diagram
        property string currentOrgan

        color: "lightsteelblue"
        Layout.fillWidth: true
        Layout.fillHeight: true

        Components.OrganImage {
            id: liverImage
            organSystem: root.organSystem
            organ: "liver"
            x: 50
            y: 70
            z: 1

            onClicked: diagram.handleAnswer(organ, root.currentQuizOrgan)
        }

        Components.OrganImage {
            id: intestineImage
            organSystem: root.organSystem
            organ: "intestine"
            x: 120
            y: 90

            onClicked: diagram.handleAnswer(organ, root.currentQuizOrgan)
        }

        Components.OrganImage {
            id: stomachImage
            organSystem: root.organSystem
            organ: "stomach"
            x: 170
            y: 20

            onClicked: diagram.handleAnswer(organ, root.currentQuizOrgan)
        }

        Text {
            id: questionText
            anchors.right: parent.right
            anchors.top: parent.top
            text: "Where is " + root.currentQuizOrgan
        }

        Text {
            id: scoreText
            property string label: "Score"

            color: "blue"
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            text: label + ": " + root.score
        }


        function handleAnswer(answerOrgan, correctOrgan) {
            if (answerOrgan === correctOrgan) {
                root.score += 1
            }
            var index = (root.organs.indexOf(correctOrgan) + 1)
            if (index == root.organs.length) {
                gameOver()
            } else {
                root.currentQuizOrgan = root.organs[index]
            }
        }

        function gameOver() {
            scoreText.label = "Game Over, your score is"
        }
    }
}
