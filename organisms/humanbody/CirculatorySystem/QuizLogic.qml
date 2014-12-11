import QtQuick 2.2
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.2

import components 1.0 as Components

RowLayout {
    id: root
    property string organism
    property string organSystem
    property string currentQuizOrgan
    property string currentOrgan: "aorta"
    property string responseSheet
    property string wrongAnwserColor: "red"
    property string correctAnwserColor: "green"

    property variant organs: [ "aorta","inferior_vena_cava", "left_atrium","left_pulmonary_artries", "left_pulmonary_veins", "left_ventricle","pulmonary_valves", "right_atrium" , "right_pulmonary_artries", "right_pulmonary_veins", "right_ventricle" ,"superior_vena_cava"]
    property variant labelColorSheet: { "aorta":root.wrongAnwserColor,
                                        "inferior_vena_cava":root.wrongAnwserColor,
                                        "left_atrium":root.wrongAnwserColor,
                                        "left_pulmonary_artries":root.wrongAnwserColor,
                                        "left_pulmonary_veins": root.wrongAnwserColor,
                                        "left_ventricle":root.wrongAnwserColor,
                                        "pulmonary_valves":root.wrongAnwserColor,
                                        "right_atrium" :root.wrongAnwserColor,
                                        "right_pulmonary_artries":root.wrongAnwserColor,
                                        "right_pulmonary_veins":root.wrongAnwserColor,
                                        "right_ventricle" :root.wrongAnwserColor,
                                        "superior_vena_cava":root.wrongAnwserColor
                                       }
    property variant organsLabelSheet: { "aorta":"Aorta",
                                         "inferior_vena_cava":"Inferior Vena Cava",
                                         "left_atrium":"Left Atrium",
                                         "left_pulmonary_artries":"Left Pulmonary Artries",
                                         "left_pulmonary_veins":"Left Pulmonary Veins",
                                         "left_ventricle":"Left Ventricle",
                                         "pulmonary_valves":"Pulmonary Valves",
                                         "right_atrium" :"Right Atrium",
                                         "right_pulmonary_artries":"Right Pulmonary Artries",
                                         "right_pulmonary_veins":"Right Pulmonary Veins",
                                         "right_ventricle" :"Right Ventricle",
                                         "superior_vena_cava":"Superior Vena Cava"
                                         }
    property variant quizAnswerSheetCorrect: []
    property variant quizAnswerSheetYour: []
    property string answerListString

    ListModel{
        id:quizAnswerSheetModel
    }



    property int score: 0
    property bool isGameOver: false

    signal selected(var selectDisplaySummary)



    Rectangle {
               id: diagram
               color: "#55ADAB"
               Layout.fillWidth: true
               Layout.fillHeight: true
               border.color: "green"

               Button {
                   id: button
                   style: Components.ButtonStyle {}
                   text: "Visualize Score Summary"
                   x: 600
                   y: 400
                   visible: root.isGameOver
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




                    Item {
                        height: 100
                        width: 100

                        x: 450
                        y: 600



                        Image {
                            id: backimagebutton
                            anchors.fill: parent
                            source: "../../../back.png"
                        }

                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                stack.push(modeSelection)
                            }
                        }

                        Text {
                            text: "Back"
                            anchors.top: backimagebutton.bottom
                            x:40



                            color: "white"
                            font.bold: true
                        }
                    }







               }

                Rectangle {
                  anchors {
                    right: parent.right;
                    top:parent.top
                    topMargin: 100
                    rightMargin: 90
                    margins: 50;
                    }
                  radius: 30
                  border.width: 3
                  border.color: "black"


                  height: 200; width: 400

                  //spacing: 5

                  Text {
                        id: questionText
                        font.bold: true
                        font.pixelSize: 30
                        text: "Question:- where is " + root.organsLabelSheet[root.currentQuizOrgan] + "?"
                        wrapMode: Text.WordWrap
                        width:380
                        anchors{
                            top:parent.top
                            topMargin: 20
                            left:parent.left
                            leftMargin: 20

                        }
                  }

                   Text {
                        id: scoreText
                        property string label: "Score"
                        font.bold: true
                        font.pixelSize: 30
                        color: "brown"
                        text: label
                        wrapMode: Text.WordWrap
                        width:220
                        visible: false
                        anchors{
                            top:questionText.bottom
                            topMargin: 10
                            left:questionText.left
                            leftMargin:100

                        }
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

//                    root.quizAnswerSheetCorrect.length = correctOrgan
//                    root.quizAnswerSheetYour.length = answerOrgan

                    root.quizAnswerSheetCorrect.push(correctOrgan)
                    root.quizAnswerSheetYour.push(answerOrgan)
                    //console.log(typeof(root.quizAnswerSheetYour))
                    //console.log(isArray(root.quizAnswerSheetCorrect));
                    //root.quizAnswerSheetModel.append({"correct": correctOrgan, "your":answerOrgan});
                    //root.quizAnswerSheet[correctOrgan] = answerOrgan;
                    root.answerListString = root.answerListString + 'ListElement{ your: "'+root.organsLabelSheet[answerOrgan]+'" ; correct: "'+root.organsLabelSheet[correctOrgan]+'";  image:"'+correctOrgan+'.png\"  } '
                    //console.log(root.answerListString)
                    root.labelColorSheet = tempLabelColorSheet
                }

                function gameOver() {
                    scoreText.label = "Game over"
                    root.isGameOver = true
                    scoreText.visible = true
                }

                function scoreSummarySheet(answerOrgan, correctOrgan){
                   root.responseSheet = root.responseSheet  + "Question: Where is " + correctOrgan  +
                   "? Your Answer: " + answerOrgan + "\n"
                    return root.responseSheet
               }
                function isArray(myArray) {
                    return myArray.constructor.toString().indexOf("Array") > -1;
                }

   }

}

