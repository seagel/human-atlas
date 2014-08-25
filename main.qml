import QtQuick 2.2
import QtQuick.Controls 1.2
import QtWebKit 3.0
import humanbody 1.0 as HumanBody

ApplicationWindow {
    id: app
    visible: true
    width: 640
    height: 480
    title: qsTr("Balaswecha")

    property string currentOrganSystem
    property string currentOrganism: "humanbody"

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
        Explorer {
        }
    }

    Component {
        id: quiz
        Quiz {
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
