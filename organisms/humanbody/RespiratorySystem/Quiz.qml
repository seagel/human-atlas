import QtQuick 2.0
import QtQuick.Layouts 1.1

import QtQuick.Controls 1.2

import components 1.0 as Components

RowLayout {
    id: root
    property string organism
    property string organSystem
    property string currentQuizOrgan: "bronchi_left"
    property variant organs: ["bronchi_left", "bronchi_right", "bronchioles", "diaphragm", "epiglottis","lungs", "nose","oral_cavity", "ribs", "trachea" ]

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
            quizAnswerSheetYourAnswer : quizLogic.quizAnswerSheetYour
            quizAnswerSheetCorrectAnswer : quizLogic.quizAnswerSheetCorrect
            quizAnswersList : quizLogic.quizAnswerSheet
            //quizAnswerSheetModel: quizLogic.quizAnswersListModel
            numberQuestions: quizLogic.organs.length
            score: quizLogic.score
            labelColorSheet: quizLogic.labelColorSheet
            answerListStringsNames: quizLogic.answerListString



        }
    }  
}

