import QtQuick 2.2
import QtQuick.Controls 1.2
import QtWebKit 3.0
import humanbody 1.0 as HumanBody

ApplicationWindow {
    id: app
    visible: true
    width: 1024
    height: 768
    title: qsTr("Balaswecha")

    property string currentOrganism: "humanbody"
    property string currentOrganSystem

    Theme {     //This will be accessed all over the code
        id: theme   //Global ID
    }

    StackView {
        id: stack
        anchors.fill: parent
        initialItem: Home {
            onSelected: {
                app.currentOrganSystem =  selectedComponent;
                stack.push(mode);
            }
        }
    }

    Component {
        id: explorer
        ExploreLoader {
            organism: app.currentOrganism
            organSystem: app.currentOrganSystem
        }
    }

    Component {
        id: quiz
        QuizLoader {
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
