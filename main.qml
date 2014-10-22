import QtQuick 2.2
import QtQuick.Controls 1.2

ApplicationWindow {
    id: app
    visible: true
    width: 1024
    height: 768
    title: qsTr("HUMAN ATLAS")

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
                app.currentOrganSystem =  selectedComponent;
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
}
