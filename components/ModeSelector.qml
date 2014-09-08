import QtQuick 2.0

Rectangle {
    id: root
    anchors.fill: parent
    clip: true

    property string mode
    property variant build
    property variant explore
    property variant quiz
    property variant modeSheet: {"build": root.build,
                                 "explore": explore,
                                 "quiz": quiz}

    Loader {
        anchors.fill: parent
        sourceComponent: root.modeSheet[root.mode]
   }
}
