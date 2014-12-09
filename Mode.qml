import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1

import components 1.0 as Components

Item {
    id: root
    signal buildSelected
    signal exploreSelected
    signal quizSelected

    Rectangle {
        anchors.fill: parent
        color: "#55ADAB"
        z:0
    }

    Row {
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: parent.top
            topMargin: 200
        }
        spacing: 100

        Item {
            height: 250
            width: 250

            Image {
                anchors.fill: parent
                source: "images/explore.png"
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    root.exploreSelected()
                }
            }

            Text {
                text: "Explore"
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    top: parent.top
                    topMargin: 260
                }
                color: "white"
                font.bold: true
            }
        }

        Item {
            height: 250
            width: 250

            Image {
                anchors.fill: parent
                source: "images/quiz.png"
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    root.quizSelected()
                }
            }

            Text {
                text: "Quiz"
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    top: parent.top
                    topMargin: 260
                }
                color: "white"
                font.bold: true
            }
        }

        Item {
            height: 250
            width: 250

            Image {
                anchors.fill: parent
                source: "images/build.png"
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    root.buildSelected()
                }
            }

            Text {
                text: "Build"
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    top: parent.top
                    topMargin: 260
                }
                color: "white"
                font.bold: true
            }
        }
    }

    Item {
        height: 100
        width: 100
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: parent.top
            topMargin: 600
        }

        Image {
            anchors.fill: parent
            source: "images/back.png"
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                stack.push(homeSelection)
            }
        }

        Text {
            text: "Back"
            anchors {
                horizontalCenter: parent.horizontalCenter
                top: parent.top
                topMargin: 100
            }
            color: "white"
            font.bold: true
        }
    }
}
