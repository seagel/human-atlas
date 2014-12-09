import QtQuick 2.2
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.2

import components 1.0 as Components

RowLayout {
    id: root
    property string organism
    property string organSystem
    property string currentQuizOrgan
    property string currentOrgan: "mouth"
    property string responseSheet
    property string wrongAnwserColor: "red"
    property string correctAnwserColor: "green"

    property variant organs: [ "mouth","oesophagus", "liver","stomach", "small_intestine", "large_intestine","anus", "pancreas" , "gall_bladder"]
    property variant labelColorSheet: { "mouth" :root.wrongAnwserColor,
                                        "oesophagus" :root.wrongAnwserColor,
                                        "liver":root.wrongAnwserColor,
                                        "stomach": root.wrongAnwserColor,
                                       "small_intestine": root.wrongAnwserColor,
                                        "large_intestine": root.wrongAnwserColor,
                                        "anus": root.wrongAnwserColor,
                                        "pancreas": root.wrongAnwserColor,
                                        "gall_bladder": root.wrongAnwserColor
                                       }

    property int score: 0
    property bool isGameOver: false

    signal selected(var selectDisplaySummary)


    Rectangle {
               id: diagram
               color: "lightsteelblue"
               Layout.fillWidth: true
               Layout.fillHeight: true
               border.color: "green"

               Button {
                   id: button
                   style: Components.ButtonStyle {}
                   text: "Visualize Score Summary"
                   x: 700
                   y: 70
                   onClicked: stack.push(scoreSummary)
                }

               Organs {
                    organism: root.organism
                    organSystem: root.organSystem
                    labelColorSheet: root.labelColorSheet
                    onClicked: {
                        if (!root.isGameOver)
                            diagram.handleAnswer(organ, root.currentQuizOrgan)
                    }

                    Button {
                         text: "Back"
                         style: Components.ButtonStyle {}
                         width: 50
                         height: 50
                         x: 450
                         y: 600
                         onClicked: {
                             stack.push(modeSelection)
                         }
                     }
               }

                Column {
                  anchors {
                    right: parent.right;
                    margins: 10;
                    }

                  height: parent.height; width: 300
                  spacing: 5

                  Text {
                        id: questionText
                        font.bold: true
                        font.pixelSize: 14
                        text: "Question: where is " + root.currentQuizOrgan + "?"
                  }

                   Text {
                        id: scoreText
                        property string label: "Score"
                        font.bold: true
                        font.pixelSize: 14
                        color: "brown"
                        text: label + ": " + root.score
                    }
                }

                function handleAnswer(answerOrgan, correctOrgan) {
                    scoreSummarySheet(answerOrgan, correctOrgan)
                    var tempLabelColorSheet = root.labelColorSheet
                    if (answerOrgan === correctOrgan) {
                        tempLabelColorSheet[answerOrgan] = root.correctAnwserColor
                        root.score += 1
                    }
                    var index = (root.organs.indexOf(correctOrgan) + 1)
                    if (index == root.organs.length) {
                        gameOver()

                    } else {
                        root.currentQuizOrgan = root.organs[index]
                    }

                    root.labelColorSheet = tempLabelColorSheet
                }

                function gameOver() {
                    scoreText.label = "Game over, your score is"
                    root.isGameOver = true
                }

                function scoreSummarySheet(answerOrgan, correctOrgan){
                   root.responseSheet = root.responseSheet  + "Question: Where is " + correctOrgan  +
                   "? Your Answer: " + answerOrgan + "\n"
                    return root.responseSheet
               }

   }

}

