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
            organism: app.currentOrganism
            onSelected: {
                app.currentOrganSystem =  selectedComponent;
                stack.push(mode);
            }
        }
    }

    Component {
        id: explorer

        ModeLoader {
            mode: "explore"
            organism: app.currentOrganism
            organSystem: app.currentOrganSystem
        }
    }

    Component {
        id: quiz

        ModeLoader {
            mode: "quiz"
            organism: app.currentOrganism
            organSystem: app.currentOrganSystem
        }
    }

    Component {
        id: mode
        Mode {
            onExploreSelected: {
                stack.push(explorer)
            }

            onQuizSelected: {
                stack.push(quiz)
            }
        }
    }
}
