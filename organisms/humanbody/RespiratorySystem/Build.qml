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
        property variant droppedOrgans: ({})
        property variant organs: []
        property int droppedX
        property int droppedY
        property string wrongAnwserColor: "red"
        property string correctAnwserColor: "green"
        property variant labelColorSheet: {
            "bronchi_left": root.wrongAnwserColor,
            "bronchi_right": root.wrongAnwserColor,
            "bronchioles": root.wrongAnwserColor,
            "diaphragm":root.wrongAnwserColor,
            "epiglottis": root.wrongAnwserColor,
            "lungs" :root.wrongAnwserColor,
            "nose": root.wrongAnwserColor,
            "oral_cavity":  root.wrongAnwserColor,
            "ribs" : root.wrongAnwserColor,
            "trachea": root.wrongAnwserColor
        }
        property variant organsLabelSheet: {
            "bronchi_left": "Bronchi Left" ,
            "bronchi_right": "Bronchi Right" ,
            "bronchioles":"Bronchioles" ,
            "diaphragm": "Diaphragm",
            "epiglottis": "Epiglottis" ,
            "lungs" : "Lungs" ,
            "nose": "Nose",
            "oral_cavity": "Oral Cavity"  ,
            "ribs" : "Ribs" ,
            "trachea": "Trachea"
        }

        Text {
            id: dropAreaText
            anchors.fill: parent
            text: qsTr("Work space")
            font.bold: true
            font.pixelSize: 14
            horizontalAlignment: Text.AlignHCenter
        }

        onDropped: {
            droppedOrgans[drag.source.organ] = {};
            droppedOrgans[drag.source.organ].x = drag.x;
            droppedOrgans[drag.source.organ].y = drag.y;
        }

        Image {
            id: background
            anchors {
                left: parent.left
                top: parent.top
                leftMargin: -45
                topMargin: -20
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

        Text {
            id: feedbackText
            text: ""
            color: "red"
            font.bold: true
            font.pixelSize: 14
            x: 70
            y: 600
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
                    for (var organ in dropArea.droppedOrgans) {
                        var dX = dropArea.droppedOrgans[organ].x,
                            dY = dropArea.droppedOrgans[organ].y,
                            rX = root.referenceCoordinates[organ].coordinates.x,
                            rY = root.referenceCoordinates[organ].coordinates.y,
                            limit = 30; // Needs to be checked.

                        if (((dX >= rX - limit) && (dX < rX + limit)) && ((dY >= rY - limit) && (dY < rY + limit)))
                           dropArea.labelColorSheet[organ] = dropArea.correctAnwserColor;
                    }

                    workSpaceOrgansList.labelColorSheet = dropArea.labelColorSheet;
                    workSpaceOrgansList.opacity = 1
                    buildSpaceOrgansList.opacity = 0.2

                    feedbackButton.text = "Reset"
                    dropArea.feedbackReset()
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

        for (var key in referenceCoordinates)
            if (referenceCoordinates.hasOwnProperty(key))
                numberOfOrgans++;
    }
}
