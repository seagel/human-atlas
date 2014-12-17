import QtQuick 2.2
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.2

import components 1.0 as Components
import "../../../components"

RowLayout {
    id: root
    property string organism
    property string organSystem
    property string currentQuizOrgan
    property string currentOrgan: "mouth"
    property string responseSheet
    property string wrongAnwserColor: "red"
    property string correctAnwserColor: "green"
    property Note sugg: null


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
    property variant organsLabelSheet: { "mouth" :"Mouth",
                                          "oesophagus" :"Oesophagus",
                                          "liver":"Liver",
                                          "stomach": "Stomach",
                                         "small_intestine": "Small Intestine",
                                          "large_intestine": "Large Intestine",
                                          "anus": "Anus",
                                          "pancreas": "Pancreas",
                                          "gall_bladder": "Gall Bladder"
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
                        diagram.hideNote();
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
                Item {
                    id : suggestion
                    width : 180
                    height : 130
                    x:800;y:10

                    function showNote() {
                        sugg = Qt.createQmlObject(
                                "import \"../../../components\"\n"+
                                "Note{ \n" +
                                "textTopMargin: 5\n" +
                                "textLeftMargin: 10\n" +
                                "textWidth: 160\n" +
                                "textHeight: 100\n" +
                                "fontSize:20\n"+
                                "anchors.fill: parent\n" +
                                "text : \"Click on the Asked Organ.\"}\n" , suggestion, "Note")
                    }
                }
                function hideNote(){
                    if(sugg!=null){
                    sugg.destroy();
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
                Component.onCompleted: {
                    suggestion.showNote();
                }

   }

}

