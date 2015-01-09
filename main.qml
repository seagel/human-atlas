import QtQuick 2.2
import QtQuick.Controls 1.2

ApplicationWindow {
    id: app
    visible: true
    minimumHeight: 768
    minimumWidth: 1024
    title: qsTr("Human Atlas - Bala Swecha")

    property string currentOrganism: "humanbody"
    property string currentOrganSystem

    Theme {     //This will be accessed all over the code
        id: theme   //Global ID
    }

    StackView {
        id: stack
        anchors.fill: parent
        initialItem: Home {
            id: homeSelection
            organism: app.currentOrganism
            onSelected: {
                app.currentOrganSystem = selectedComponent;
                stack.push(modeSelection);
            }
        }
    }

    Component {
        id: buildSelection
        ModeLoader {
            mode: "build"
            organism: app.currentOrganism
            organSystem: app.currentOrganSystem
        }
    }

    Component {
        id: exploreSelection
        ModeLoader {
            mode: "explore"
            organism: app.currentOrganism
            organSystem: app.currentOrganSystem
        }
    }

    Component {
        id: quizSelection
        ModeLoader {
            mode: "quiz"
            organism: app.currentOrganism
            organSystem: app.currentOrganSystem
        }
    }

    Component {
        id: modeSelection

        Mode {
            onBuildSelected: {
                stack.push(buildSelection)
            }

            onExploreSelected: {
                stack.push(exploreSelection)
            }

            onQuizSelected: {
                stack.push(quizSelection)
            }
        }
    }
    Item {
        height: 50
        width: 50
        anchors {
            left: parent.left
            leftMargin: 30
            top: parent.top
            topMargin: 20
        }

        Image {
            anchors.fill: parent
            source: "images/quit.png"
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                Qt.quit();
            }
        }

        Text {
            text: "Quit"
            anchors {
                horizontalCenter: parent.horizontalCenter
                top: parent.top
                topMargin: 50
            }
            color: "white"
            font.bold: true
        }
    }
}
