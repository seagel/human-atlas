import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Particles 2.0
import QtWebKit 3.0
import QtQuick.Layouts 1.1

import org.swecha.humanatlas 1.0

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Balaswecha")

    RowLayout {
        anchors.fill: parent

        Rectangle {
            color: "lightsteelblue"
            Layout.fillWidth: true
            Layout.fillHeight: true

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

        WebView {
            url: "qrc:///heart.html"
            Layout.preferredWidth: 200
            Layout.fillHeight: true
        }
    }
}
