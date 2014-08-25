import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Layouts 1.1

Item {
    id: root
    signal exploreSelected
    signal quizSelected

    ColumnLayout {
        anchors.centerIn: parent

        Button {
            text: "Explore"
            onClicked: root.exploreSelected()
        }
        Button {
            text: "Quiz"
            onClicked: root.quizSelected()
        }
    }
}
