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
    property variant coordinatesSheet: {"liver": {"x": 50, "y": 70, "z": 1},
                                       "intestine": {"x": 120, "y": 90},
                                       "stomach": {"x": 170, "y": 20}
                                       }

    signal clicked(var organ)

    Components.OrganImage {
        id: liverImage
        organ: "liver"
        drapOrgans: root.dragOrgans
        x: root.coordinatesSheet[liverImage.organ].x
        y: root.coordinatesSheet[liverImage.organ].y
        z: root.coordinatesSheet[liverImage.organ].z

        onClicked: root.clicked(organ)

        Text {
            text: liverImage.organ
            color: root.organLabelColor(liverImage.organ)
            visible: root.displayOrganLabel
       }
    }

    Components.OrganImage {
        id: intestineImage
        organ: "intestine"
        drapOrgans: root.dragOrgans
        x: root.coordinatesSheet[intestineImage.organ].x
        y: root.coordinatesSheet[intestineImage.organ].y

        onClicked: root.clicked(organ)

        Text {
            text: intestineImage.organ
            color: root.organLabelColor(intestineImage.organ)
            visible: root.displayOrganLabel
            x: 250
       }
    }

    Components.OrganImage {
        id: stomachImage
        organ: "stomach"
        drapOrgans: root.dragOrgans
        x: root.coordinatesSheet[stomachImage.organ].x
        y: root.coordinatesSheet[stomachImage.organ].y

        onClicked: root.clicked(organ)

        Text {
            text: stomachImage.organ
            color: root.organLabelColor(stomachImage.organ)
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
