import QtQuick 2.0
import components 1.0 as Components

Item {
    id: root
    property string organism
    property string organSystem
    property string currentOrgan
    property variant labelColorSheet
    property bool displayOrganLabel: false
    property bool dragOrgans: true
    property variant coordinatesSheet: {
        "mouth" : {"x": 120, "y": 1, "z": 1},
        "oesophagus": {"x": 157, "y": 140, "z": 1},
        "liver": {"x": 120, "y": 290, "z": -1},
        "stomach": {"x": 183, "y": 311},
        "small_intestine": {"x": 145, "y": 435, "z": 2},
        "large_intestine": {"x": 120, "y": 400, "z": 1},
        "anus": {"x": 173, "y": 615, "z": 1},
        "pancreas": {"x": 170, "y": 310, "z": -10},
        "gall_bladder": {"x": 130, "y": 350, "z": 10}
    }

    signal clicked(var organ)

    Components.OrganImage {
        id: mouthImage
        organ: "mouth"
        dragOrgans: root.dragOrgans
        x: root.coordinatesSheet[mouthImage.organ].x
        y: root.coordinatesSheet[mouthImage.organ].y
        z: root.coordinatesSheet[mouthImage.organ].z

        onClicked: root.clicked(organ)

        Text {
            text: mouthImage.organ
            color: root.organLabelColor(mouthImage.organ)
            visible: root.displayOrganLabel
        }
    }

    Components.OrganImage {
        id: oesophagusImage
        organ: "oesophagus"
        dragOrgans: root.dragOrgans
        x: root.coordinatesSheet[oesophagusImage.organ].x
        y: root.coordinatesSheet[oesophagusImage.organ].y
        z: root.coordinatesSheet[oesophagusImage.organ].z
    
        onClicked: root.clicked(organ)
    
        Text {
            text: oesophagusImage.organ
            color: root.organLabelColor(oesophagusImage.organ)
            visible: root.displayOrganLabel
        }
    }

    Components.OrganImage {
        id: liverImage
        organ: "liver"
        dragOrgans: root.dragOrgans
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
        id: stomachImage
        organ: "stomach"
        dragOrgans: root.dragOrgans
        x: root.coordinatesSheet[stomachImage.organ].x
        y: root.coordinatesSheet[stomachImage.organ].y
    
        onClicked: root.clicked(organ)
    
        Text {
            text: stomachImage.organ
            color: root.organLabelColor(stomachImage.organ)
            visible: root.displayOrganLabel
        }
    }

    Components.OrganImage {
        id: small_intestineImage
        organ: "small_intestine"
        dragOrgans: root.dragOrgans
        x: root.coordinatesSheet[small_intestineImage.organ].x
        y: root.coordinatesSheet[small_intestineImage.organ].y
    
        onClicked: root.clicked(organ)
    
        Text {
            text: small_intestineImage.organ
            color: root.organLabelColor(small_intestineImage.organ)
            visible: root.displayOrganLabel
            x: 250
        }
    }
    
    Components.OrganImage {
        id: large_intestineImage
        organ: "large_intestine"
        dragOrgans: root.dragOrgans
        x: root.coordinatesSheet[large_intestineImage.organ].x
        y: root.coordinatesSheet[large_intestineImage.organ].y
        z: root.coordinatesSheet[large_intestineImage.organ].z
    
        onClicked: root.clicked(organ)
    
        Text {
            text: large_intestineImage.organ
            color: root.organLabelColor(large_intestineImage.organ)
            visible: root.displayOrganLabel
            x: 250
        }
    }

    Components.OrganImage {
        id: anusImage
        organ: "anus"
        dragOrgans: root.dragOrgans
        x: root.coordinatesSheet[anusImage.organ].x
        y: root.coordinatesSheet[anusImage.organ].y
    
        onClicked: root.clicked(organ)
    
        Text {
            text: anusImage.organ
            color: root.organLabelColor(anusImage.organ)
            visible: root.displayOrganLabel
        }
    
    }

    Components.OrganImage {
        id: pancreasImage
        organ: "pancreas"
        dragOrgans: root.dragOrgans
        x: root.coordinatesSheet[pancreasImage.organ].x
        y: root.coordinatesSheet[pancreasImage.organ].y
        z: root.coordinatesSheet[pancreasImage.organ].z
    
        onClicked: root.clicked(organ)
    
        Text {
            text: liverImage.organ
            color: root.organLabelColor(liverImage.organ)
            visible: root.displayOrganLabel
        }
    }

    Components.OrganImage {
        id: gall_bladderImage
        organ: "gall_bladder"
        dragOrgans: root.dragOrgans
        x: root.coordinatesSheet[gall_bladderImage.organ].x
        y: root.coordinatesSheet[gall_bladderImage.organ].y
        z: root.coordinatesSheet[gall_bladderImage.organ].z
    
        onClicked: root.clicked(organ)
    
        Text {
            text: gall_bladderImage.organ
            color: root.organLabelColor(gall_bladderImage.organ)
            visible: root.displayOrganLabel
        }
    }

    function organLabelColor(organName) {
        var labelColor = "red";

        for (var item in root.labelColorSheet) {
            if (item === organName)
                labelColor = root.labelColorSheet[item];
        }
        return labelColor;
    }
}
