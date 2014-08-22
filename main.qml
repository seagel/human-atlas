import QtQuick 2.2
import QtQuick.Controls 1.1
import QtWebKit 3.0
import humanbody 1.0 as HumanBody

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Balaswecha")

    StackView {
        id: stack
        anchors.fill: parent
        initialItem: Home {
            onExplore: stack.push(explorer)
            onQuiz: stack.push(quiz)
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
}
