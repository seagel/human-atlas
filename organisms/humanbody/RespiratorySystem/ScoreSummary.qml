import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.2

import components 1.0 as Components

Item {
    id: root
    property string organism
    property string organSystem
    property string responseText

    property variant labelColorSheet

    property variant quizAnswersList
    property variant quizAnswerSheetCorrectAnswer
    property variant quizAnswerSheetYourAnswer
    property string answerListStringsNames

    property int numberQuestions: 0
    property int score: 0





    Rectangle {
        id: diagram
        anchors.fill: parent
        color: "#55ADAB"
        Layout.fillWidth: true
        Layout.fillHeight: true

        Organs {
            organism: root.organism
            organSystem: root.organSystem
            labelColorSheet: root.labelColorSheet
            displayOrganLabel: true

            Item {
                height: 100
                width: 100

                x: 430
                y: 600



                Image {
                    id: backimagebutton
                    anchors.fill: parent
                    source: "../../../back.png"
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        stack.push(quizLogic)
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

        Text {
            text: "Your score is: " + root.score + "/" + root.numberQuestions
            y: 50;x:410
            //Font.pixelSize: 40
        }


        TableView {
            id:answersTable
           rowDelegate: Rectangle{
               width: childrenRect.width
               height: 75
               border.width: 1
               color: "lightblue"


           }





           TableViewColumn{ role: "your"  ; title: "Your Answer" ; width: 130;  }
           TableViewColumn{ role: "correct" ; title: "Correct Answer" ; width: 130 }
           TableViewColumn{ role: "image"; title: "Image";width:150 ; delegate: Image {

                   source: styleData.value
               }  }
           x:550;y:30
           width:460
           height: 710

        }

        Component.onCompleted: {

            var newListModel = Qt.createQmlObject('import QtQuick 2.2; \
                    ListModel {'+ root.answerListStringsNames +'}', parent);
                answersTable.model= newListModel;
            //console.log("test")


        }





    }



}





