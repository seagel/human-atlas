import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Particles 2.0

import org.swecha.humanatlas 1.0

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Balaswecha")

    Rectangle {
        color: "lightsteelblue"
        anchors.fill: parent
        Image {
            id: heart
            source: "qrc:///lungs.png"

            ImageMouseArea {
                anchors.fill: parent

                imageName: parent.source
                onClicked: console.log("Clicked" + imageName)
            }
        }

        Image {
            id: oesophagus
            source: "qrc:///heart.png"
            x: 120
            y: 90

            ImageMouseArea {
                anchors.fill: parent

                imageName: parent.source
                onClicked: console.log("Clicked " + imageName)
            }
        }

    }
}
