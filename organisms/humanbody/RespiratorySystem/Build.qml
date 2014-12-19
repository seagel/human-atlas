import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtWebKit 3.0
import QtQuick.Controls 1.2
import JSONReader 1.0

import components 1.0 as Components

RowLayout {
    id: root
    property string organism
    property string organSystem
    property string currentOrgan
    property int organMatches: 0
    property  int  numberOfOrgans: 0
    property variant referenceCoordinates
    property variant coordinatesSheet: {
        "bronchi_left": {
            "coordinates": {
                "x": 0,
                "y": 0,
                "z": 1
            }
        },
        "bronchi_right": {
            "coordinates": {
                "x": 0,
                "y": 0,
                "z": 1
            }
        },
        "bronchioles": {
            "coordinates": {
                "x": 0,
                "y": 0,
                "z": -1
            }
        },
        "nose": {
            "coordinates": {
                "x": 0,
                "y": 0,
                "z": -1
            }
        },
        "oral_cavity": {
            "coordinates": {
                "x": 0,
                "y": 0,
                "z": 0
            }
        },
        "ribs": {
            "coordinates": {
                "x": 0,
                "y": 0,
                "z": 5
            }
        },
        "anus": {
            "coordinates": {
                "x": 0,
                "y": 0,
                "z": 1
            }
        },
        "trachea": {
            "coordinates": {
                "x": 0,
                "y": 0,
                "z": 1
            }
        }
    }

    anchors.fill: parent

    JSONReader {
        id: myFile
        source: _organismsDataDirectory + "/" + root.organism + "/" + root.organSystem + "/" + "data.json"
        onError: console.log(msg)
    }

    Rectangle {
        width: parent.width / 2
        height: parent.height
        anchors.left: parent.left

        Text {
            anchors.fill: parent
            text: qsTr("Organs")
            font.bold: true
            font.pixelSize: 14
            horizontalAlignment: Text.AlignHCenter
        }

        Organs {
            id: buildSpaceOrgansList
            organism: root.organism
            organSystem: root.organSystem
            currentOrgan: root.currentOrgan
            dragOrgans: true
            coordinatesSheet: root.coordinatesSheet
        }

        Button {
            text: "Back"
            style: Components.ButtonStyle {
            }
            width: 50
            height: 50
            x: 400
            y: 630
            onClicked: {
                stack.push(modeSelection)
            }
        }
    }

    DropArea {
        id: dropArea
        width: parent.width / 2
        height: parent.height
        anchors.right: parent.right
        Drag.active: true
        property string droppedOrgan
        property variant organs: []
        property int droppedX
        property int droppedY
        property string wrongAnwserColor: "red"
        property string correctAnwserColor: "green"
        property variant labelColorSheet: {
            "mouth": wrongAnwserColor,
            "oesophagus": wrongAnwserColor,
            "liver": wrongAnwserColor,
            "stomach": wrongAnwserColor,
            "small_intestine": wrongAnwserColor,
            "large_intestine": wrongAnwserColor,
            "anus": wrongAnwserColor,
            "pancreas": wrongAnwserColor,
            "gall_bladder": wrongAnwserColor
        }

        Text {
            id: dropAreaText
            anchors.fill: parent
            text: qsTr("Work space")
            font.bold: true
            font.pixelSize: 14
            horizontalAlignment: Text.AlignHCenter
        }

        Image {
            id: background
            anchors {
                left: parent.left
                top: parent.top
                leftMargin: 0
                topMargin: 28
            }
            source: _organismsDataDirectory + "/" + root.organism + "/" + root.organSystem + "/background.png"
            z: -2
        }

        Organs {
            id: workSpaceOrgansList
            organism: root.organism
            organSystem: root.organSystem
            currentOrgan: root.currentOrgan
            dragOrgans: false
            displayOrganLabel: true
            opacity: 0
        }

        Button {
            id: feedbackButton
            style: Components.ButtonStyle {}
            text: "Feedback"
            x: 0
            y: 670
            width: 100
            height: 50

            onClicked: {
                if (feedbackButton.text == "Reset") {
                    stack.push(buildSelection);
                } else {
                    var droppedOrgans = _globalDataStore.getKeys().split(' ');
                    for (var organ in droppedOrgans) {
                        var dX = _globalDataStore.getOrgan(droppedOrgans[organ]).split(',')[0],
                            dY = _globalDataStore.getOrgan(droppedOrgans[organ]).split(',')[1],
                            rX = root.referenceCoordinates[droppedOrgans[organ]].coordinates.x + dropArea.width,
                            rY = root.referenceCoordinates[droppedOrgans[organ]].coordinates.y,
                            limit = 30; // Needs to be checked.

                        if (((dX >= rX - limit) && (dX < rX + limit)) && ((dY >= rY - limit) && (dY < rY + limit)))
                           dropArea.labelColorSheet[droppedOrgans[organ]] = dropArea.correctAnwserColor;
                    }

                    workSpaceOrgansList.labelColorSheet = dropArea.labelColorSheet;
                    workSpaceOrgansList.opacity = 1;
                    buildSpaceOrgansList.opacity = 0.2;

                    feedbackButton.text = "Reset";
                    dropArea.feedbackReset();
                }
            }
        }

        function feedbackReset() {
            if (feedbackButton.text == "Reset") {
                feedbackButton.enabled = true
            } else {
                feedbackButton.enabled = false
            }
        }
    }

    Component.onCompleted: {
        referenceCoordinates = JSON.parse(myFile.read());

        for (var key in referenceCoordinates) {
            if (referenceCoordinates.hasOwnProperty(key))
                dropArea.organs.push(key);
        }

        _globalDataStore.clear();
    }
}
