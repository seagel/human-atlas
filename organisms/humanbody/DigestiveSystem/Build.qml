import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtWebKit 3.0
import QtQuick.Controls 1.2
import QtQuick.LocalStorage 2.0

import components 1.0 as Components

RowLayout {
    id: root
    property string organism
    property string organSystem
    property string currentOrgan
    property int organMatches: 0
    property variant coordinatesSheet: {"liver": {"x": 50, "y": 50, "z": 1},
                                       "intestine": {"x": 50, "y": 300},
                                       "stomach": {"x": 50, "y": 200}
                                       }
    anchors.fill: parent

    Rectangle {
        width: parent.width/2
        height: parent.height
        anchors.left: parent.left

        TableView {
            id: organsTable
            headerVisible: true
            anchors.fill: parent

            TableViewColumn {
                role: "title"  ;
                title: "List of organs";
                horizontalAlignment: Text.AlignHCenter;
                }

            Organs {
                id:buildSpaceOrgansList
                organism: root.organism
                organSystem: root.organSystem
                currentOrgan: root.currentOrgan
                dragOrgans: true
                coordinatesSheet: root.coordinatesSheet  
            }
         }

        Button {
            text: "Back"
            style: Components.ButtonStyle {}
            width: 50
            height: 50
            x: 400
            y: 630
            onClicked: {
                stack.push(modeSelection)
            }
        }
    }

    DropArea {
        id:dropArea
        width: parent.width/2
        height: parent.height
        anchors.right: parent.right
        property string droppedOrgan
        Drag.active: true

        Text {
            id: dropAreaText
            anchors.fill: parent
            text: qsTr("Work" + " space")
            font.bold: true
            font.pixelSize: 14
            horizontalAlignment: Text.AlignHCenter
        }

        onDropped: {
            droppedOrgan = drag.source.organ
        }

        Organs {
            id:workSpaceOrgansList
            organism: root.organism
            organSystem: root.organSystem
            currentOrgan: root.currentOrgan
            dragOrgans: false
            displayOrganLabel: true
            opacity: 0
            property string clickedOrgan

            onClicked: {
                clickedOrgan = organ
                //TODO: Implement a better functionality to check whether the 2 organs matche
                // Here we're just checking if the names of the two organs matche
                if (dropArea.droppedOrgan == workSpaceOrgansList.clickedOrgan) {
                    root.organMatches +=1
                }
            }

        }

        Text {
            id: feedbackText
            text: ""
            color: "red"
            font.bold: true
            font.pixelSize: 14
            x: 70
            y: 600
        }

        Button {
            id: feedbackButton
            style: Components.ButtonStyle {}
            text: "Feedback"
            x: 130
            y: 630
            width: 100
            height: 50

            onClicked: {
                if (feedbackButton.text == "Reset") {
                  stack.push(buildSelection)
                }

                else {
                    // 3 here represents the total number of organs
                    // We should be able to make this more generic
                    if (root.organMatches >= 3) {
                        feedbackText.color = "green"
                        feedbackText.text += "Well done, you have successfully built the "
                                + root.organSystem + "\n"
                        dropAreaText.color = "green"
                    }

                    else {
                        workSpaceOrgansList.opacity = 1
                        buildSpaceOrgansList.opacity = 0.2
                        feedbackText.text += "Check what you got wrong" + "\n"
                        dropAreaText.color = "red"
                    }

                   feedbackButton.text = "Reset"
                   dropArea.feedbackReset()
             }

          }

        }

        function feedbackReset() {
            if (feedbackButton.text == "Reset") {
                feedbackButton.enabled = true
            }
            else {
                feedbackButton.enabled = false
            }
        }
    }
 }
