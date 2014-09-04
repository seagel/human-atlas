import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtWebKit 3.0
import QtQuick.Controls 1.2

import components 1.0 as Components

RowLayout {
    id: root
    property string organism
    property string organSystem
    property string currentQuizOrgan: "liver"
    property variant organs: ["liver", "intestine", "stomach"]

    anchors.fill: parent

    StackView {
        id: stack
        initialItem:
            QuizLogic {
                id: quizLogic
                currentQuizOrgan: root.currentQuizOrgan
                organs: root.organs
                organism: root.organism
                organSystem: root.organSystem

        }

    }

    Component {
        id: scoreSummary
        ScoreSummary {
            organism: root.organism
            organSystem: root.organSystem
            responseText: quizLogic.responseSheet
        }
    }  
}

