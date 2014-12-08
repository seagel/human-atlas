import QtQuick 2.0
import components 1.0 as Components

Item {
    id: root
    property string organism
    property string organSystem
    property string currentOrgan
    property variant labelColorSheet
    property bool displayOrganLabel: false
    property bool dragOrgans: false
    property variant coordinatesSheet: {"nose": {"x": 50, "y": 70, "z": 1},
                                       "lungs": {"x": 120, "y": 90},
                                       "diaphragm": {"x": 170, "y": 20},
 				       "trachea": {"x": 170, "y": 20}
                                       }

    signal clicked(var organ)

    Components.OrganImage {
        id: noseImage
        organ: "nose"
        dragOrgans: root.dragOrgans
        x: root.coordinatesSheet[noseImage.organ].x
        y: root.coordinatesSheet[noseImage.organ].y
        z: root.coordinatesSheet[noseImage.organ].z

        onClicked: root.clicked(organ)

        Text {
            text: noseImage.organ
            color: root.organLabelColor(noseImage.organ)
            visible: root.displayOrganLabel
       }
    }

    Components.OrganImage {
        id: lungsImage
        organ: "lungs"
        dragOrgans: root.dragOrgans
        x: root.coordinatesSheet[lungsImage.organ].x
        y: root.coordinatesSheet[lungsImage.organ].y

        onClicked: root.clicked(organ)

        Text {
            text: lungsImage.organ
            color: root.organLabelColor(lungsImage.organ)
            visible: root.displayOrganLabel
            x: 250
       }
    }

    Components.OrganImage {
        id: diaphragmImage
        organ: "diaphragm"
        dragOrgans: root.dragOrgans
        x: root.coordinatesSheet[diaphragmImage.organ].x
        y: root.coordinatesSheet[diaphragmImage.organ].y

        onClicked: root.clicked(organ)

        Text {
            text: diaphragmImage.organ
            color: root.organLabelColor(diaphragmImage.organ)
            visible: root.displayOrganLabel
       }

    }

    Components.OrganImage {
        id: diaphragmImage
        organ: "diaphragm"
        dragOrgans: root.dragOrgans
        x: root.coordinatesSheet[diaphragmImage.organ].x
        y: root.coordinatesSheet[diaphragmImage.organ].y

        onClicked: root.clicked(organ)

        Text {
            text: diaphragmImage.organ
            color: root.organLabelColor(diaphragmImage.organ)
            visible: root.displayOrganLabel
       }
    }

    function organLabelColor(organName) {
        var labelColor = "red"
        for (var item in root.labelColorSheet) {
            if (item === organName) {
                labelColor = root.labelColorSheet[item]
            }
        }
        return labelColor
    }
}
