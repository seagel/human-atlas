import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1

import components 1.0 as Components

Item {
    id: root
    signal exploreSelected
    signal quizSelected

    Column {
        anchors { top: parent.top; horizontalCenter: parent.horizontalCenter; margins: 10 }
        height: parent.height; width: 300
        spacing: 10

        Button {
            Layout.fillWidth: true
            text: "Explore"
            style: Components.ButtonStyle {}
            onClicked: root.exploreSelected()
        }
        Button {
            Layout.fillWidth: true
            text: "Quiz"
            style: Components.ButtonStyle {}
            onClicked: root.quizSelected()
        }
    }
}
