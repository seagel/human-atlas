import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Layouts 1.1

Item {
    id: root
    signal explore
    signal quiz

    ColumnLayout {
        anchors.centerIn: parent

        Button {
            text: "Explore"
            onClicked: root.explore()
        }
        Button {
            text: "Quiz"
            onClicked: root.quiz()
        }
    }
}
