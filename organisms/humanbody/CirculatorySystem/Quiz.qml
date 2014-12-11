import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtWebKit 3.0
import QtQuick.Controls 1.2

import components 1.0 as Components

RowLayout {
    id: root
    property string organism
    property string organSystem
    property string currentQuizOrgan: "aorta"
    property variant organs: [ "aorta","inferior_vena_cava", "left_atrium","left_pulmonary_artries", "left_pulmonary_veins", "left_ventricle","pulmonary_valves", "right_atrium" , "right_pulmonary_artries", "right_pulmonary_veins", "right_ventricle" ,"superior_vena_cava"]

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

