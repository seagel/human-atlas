import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtWebKit 3.0

import components 1.0 as Components

Rectangle {
    id: root
    property alias mode: selector.mode
    property string organism: "humanbody"
    property string organSystem: "CirculatorySystem"

    anchors.fill: parent
    clip: true

    Components.ModeSelector {
        id: selector
        explore: Component { Explore { organism: root.organism; organSystem: root.organSystem } }
        quiz: Component { Quiz { organism: root.organism; organSystem: root.organSystem } }
    }
}
