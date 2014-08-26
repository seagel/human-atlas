import QtQuick 2.0

Rectangle {
    id: root
    anchors.fill: parent
    clip: true

    property string mode
    property variant explore
    property variant quiz

    Loader {
        anchors.fill: parent
        sourceComponent: mode == "explore" ? root.explore : root.quiz
    }
}
