import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtWebKit 3.0

import components 1.0 as Components

Rectangle {
    id: root
    anchors.fill: parent
    clip: true
    property string currentOrgan
    property string mode: "explore"

    Loader {
        anchors.fill: parent
        sourceComponent: mode == "explore" ? explore : quiz
    }

    Component {
        id: explore

        Explore {
        }
    }

    Component {
        id: quiz

        Quiz {
        }
    }
}
