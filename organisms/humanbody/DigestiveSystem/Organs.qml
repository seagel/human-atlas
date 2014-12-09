import QtQuick 2.0
import components 1.0 as Components
import JSONReader 1.0

Item {
    id: root
    property string organism
    property string organSystem
    property string currentOrgan
    property variant labelColorSheet
    property bool displayOrganLabel: false
    property bool dragOrgans: false
    property variant coordinatesSheet

    JSONReader {
        id: myFile
        source: _organismsDataDirectory + "/" + root.organism + "/" + root.organSystem + "/" + "data.json"
        onError: console.log(msg);
    }

    signal clicked(var organ)

    Components.OrganImage {
        id: mouthImage
        organ: "mouth"
        dragOrgans: root.dragOrgans
        x: 0
        y: 0
        z: 0

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
        x: 0
        y: 0
        z: 0

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
        x: 0
        y: 0
        z: 0

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
        x: 0
        y: 0

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
        x: 0
        y: 0

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
        x: 0
        y: 0
        z: 0

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
        x: 0
        y: 0

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
        x: 0
        y: 0
        z: 0

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
        x: 0
        y: 0
        z: 0

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

    Component.onCompleted: {
        root.coordinatesSheet = JSON.parse(myFile.read());

        mouthImage.x = root.coordinatesSheet.mouth.coordinates.x;
        mouthImage.y = root.coordinatesSheet.mouth.coordinates.y;
        mouthImage.z = root.coordinatesSheet.mouth.coordinates.z;

        oesophagusImage.x = root.coordinatesSheet.oesophagus.coordinates.x;
        oesophagusImage.y = root.coordinatesSheet.oesophagus.coordinates.y;
        oesophagusImage.z = root.coordinatesSheet.oesophagus.coordinates.z;

        liverImage.x = root.coordinatesSheet.liver.coordinates.x;
        liverImage.y = root.coordinatesSheet.liver.coordinates.y;
        liverImage.z = root.coordinatesSheet.liver.coordinates.z;

        stomachImage.x = root.coordinatesSheet.stomach.coordinates.x;
        stomachImage.y = root.coordinatesSheet.stomach.coordinates.y;

        small_intestineImage.x = root.coordinatesSheet.small_intestine.coordinates.x;
        small_intestineImage.y = root.coordinatesSheet.small_intestine.coordinates.y;

        large_intestineImage.x = root.coordinatesSheet.large_intestine.coordinates.x;
        large_intestineImage.y = root.coordinatesSheet.large_intestine.coordinates.y;
        large_intestineImage.z = root.coordinatesSheet.large_intestine.coordinates.z;

        anusImage.x = root.coordinatesSheet.anus.coordinates.x;
        anusImage.y = root.coordinatesSheet.anus.coordinates.y;

        pancreasImage.x = root.coordinatesSheet.pancreas.coordinates.x;
        pancreasImage.y = root.coordinatesSheet.pancreas.coordinates.y;
        pancreasImage.z = root.coordinatesSheet.pancreas.coordinates.z;

        gall_bladderImage.x = root.coordinatesSheet.gall_bladder.coordinates.x;
        gall_bladderImage.y = root.coordinatesSheet.gall_bladder.coordinates.y;
        gall_bladderImage.z = root.coordinatesSheet.gall_bladder.coordinates.z;
    }
}
