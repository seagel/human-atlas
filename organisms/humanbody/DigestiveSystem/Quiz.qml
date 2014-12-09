import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtWebKit 3.0
import QtQuick.Controls 1.2

import components 1.0 as Components

RowLayout {
    id: root
    property string organism
    property string organSystem
    property string currentQuizOrgan: "mouth"
    property variant organs: [ "mouth","oesophagus", "liver","stomach", "small_intestine", "large_intestine","anus", "pancreas" , "gall_bladder"]

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
            organism: quizLogic.organism
            organSystem: quizLogic.organSystem
            responseText: quizLogic.responseSheet
            numberQuestions: quizLogic.organs.length
            score: quizLogic.score
            labelColorSheet: quizLogic.labelColorSheet

        }
    }  
}

