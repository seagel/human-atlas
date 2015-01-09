import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtQuick.Dialogs 1.1
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
                "x": 150,
                "y": 0,
                "z": 1
            }
        },
        "bronchioles": {
            "coordinates": {
                "x": 120,
                "y": 200,
                "z": 1
            }
        },
        "diaphragm": {
            "coordinates": {
                "x": 0,
                "y": 550,
                "z": 1
            }
        },
        "epiglottis": {
            "coordinates": {
                "x": 350,
                "y": 150,
                "z": 1
            }
        },
        "lungs": {
            "coordinates": {
                "x": 200,
                "y": 200,
                "z": 1
            }
        },
        "nose": {
            "coordinates": {
                "x": 300,
                "y": 0,
                "z": -1
            }
        },
        "oral_cavity": {
            "coordinates": {
                "x": 350,
                "y": 500,
                "z": 0
            }
        },
        "ribs": {
            "coordinates": {
                "x": 0,
                "y": 200,
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
                "x": 300,
                "y": 500,
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

    MessageDialog {
        id: errorDialog
        title: "Error"
        text: "Please drop at least one organ."
        visible: false;
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
        Item {
            height: 100
            width: 100

            x: 450
            y: 600



            Image {
                id: backimagebutton
                anchors.fill: parent
                source: "../back.png"
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    stack.push(modeSelection)
                }
            }

            Text {
                text: "Back"
                anchors.top: backimagebutton.bottom
                x:40



                color: "white"
                font.bold: true
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
            x: 350
            y: 700
            width: 150
            height: 50

            onClicked: {
                if (feedbackButton.text == "Reset") {
                    stack.push(buildSelection);
                } else {
                    var droppedOrgans = _globalDataStore.getKeys().split(' ');

                    if (droppedOrgans[0] === '') {
                        errorDialog.visible = true;
                        return;
                    }

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
