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
            id: diagram
            property string currentOrgan

            color: "lightsteelblue"
            Layout.fillWidth: true
            Layout.fillHeight: true

            OrganImage {
                organ: "lungs"

                ImageMouseArea {
                    anchors.fill: parent

                    imageName: parent.source
                    onClicked: diagram.currentOrgan = parent.organ
                }
            }

            OrganImage {
                organ: "heart"
                x: 120
                y: 90

                ImageMouseArea {
                    anchors.fill: parent

                    imageName: parent.source
                    onClicked: diagram.currentOrgan = parent.organ
                }
            }

        }

        WebView {
            url: "qrc:///" + diagram.currentOrgan + ".html"
            Layout.preferredWidth: 240
            Layout.fillHeight: true
        }
    }
}
