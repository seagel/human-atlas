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

    Image {
        anchors {
            left: parent.left
            top: parent.top
            leftMargin: -45
            topMargin: -20
        }
        source: _organismsDataDirectory + "/" + root.organism + "/" + root.organSystem + "/background.png"
        z: -2
    }

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


    }

    Components.OrganImage {
        id: oesophagusImage
        organ: "oesophagus"
        dragOrgans: root.dragOrgans
        x: 0
        y: 0
        z: 0

        onClicked: root.clicked(organ)

    }

    Components.OrganImage {
        id: liverImage
        organ: "liver"
        dragOrgans: root.dragOrgans
        x: 0
        y: 0
        z: 0

        onClicked: root.clicked(organ)


    }

    Components.OrganImage {
        id: stomachImage
        organ: "stomach"
        dragOrgans: root.dragOrgans
        x: 0
        y: 0

        onClicked: root.clicked(organ)


    }

    Components.OrganImage {
        id: small_intestineImage
        organ: "small_intestine"
        dragOrgans: root.dragOrgans
        x: 0
        y: 0

        onClicked: root.clicked(organ)


    }

    Components.OrganImage {
        id: large_intestineImage
        organ: "large_intestine"
        dragOrgans: root.dragOrgans
        x: 0
        y: 0
        z: 0

        onClicked: root.clicked(organ)


    }

    Components.OrganImage {
        id: anusImage
        organ: "anus"
        dragOrgans: root.dragOrgans
        x: 0
        y: 0

        onClicked: root.clicked(organ)


    }

    Components.OrganImage {
        id: pancreasImage
        organ: "pancreas"
        dragOrgans: root.dragOrgans
        x: 0
        y: 0
        z: 0

        onClicked: root.clicked(organ)


    }

    Components.OrganImage {
        id: gall_bladderImage
        organ: "gall_bladder"
        dragOrgans: root.dragOrgans
        x: 0
        y: 0
        z: 0

        onClicked: root.clicked(organ)


    }


    Text {
        id: mouthImageLabel
        text: mouthImage.organ
        color: root.organLabelColor(mouthImage.organ)
        visible: root.displayOrganLabel
        font.pixelSize: 20
        x:0;y:0;z:0
    }

    Text {
        id: oesophagusImageLabel
        text: oesophagusImage.organ
        color: root.organLabelColor(oesophagusImage.organ)
        visible: root.displayOrganLabel
        font.pixelSize: 20
        x:0;y:0;z:0
    }

    Text {
        id: liverImageLabel
        text: liverImage.organ
        color: root.organLabelColor(liverImage.organ)
        visible: root.displayOrganLabel
        font.pixelSize: 20
        x:0;y:0;z:0
    }

    Text {
        id: stomachImageLabel
        text: stomachImage.organ
        color: root.organLabelColor(stomachImage.organ)
        visible: root.displayOrganLabel
        font.pixelSize: 20
        x:0;y:0;z:0
    }

    Text {
        id: small_intestineImageLabel
        text: small_intestineImage.organ
        color: root.organLabelColor(small_intestineImage.organ)
        visible: root.displayOrganLabel
        font.pixelSize: 20
        x:0;y:0;z:0
    }

    Text {
        id: large_intestineImageLabel
        text: large_intestineImage.organ
        color: root.organLabelColor(large_intestineImage.organ)
        visible: root.displayOrganLabel
        font.pixelSize: 20
        x:0;y:0;z:0
    }

    Text {
        id: anusImageLabel
        text: anusImage.organ
        color: root.organLabelColor(anusImage.organ)
        visible: root.displayOrganLabel
        font.pixelSize: 20
        x:0;y:0;z:0
    }


    Text {
        id: pancreasImageLabel
        text: liverImage.organ
        color: root.organLabelColor(liverImage.organ)
        visible: root.displayOrganLabel
        font.pixelSize: 20
        x:0;y:0;z:0
    }

    Text {
        id: gall_bladderImageLabel
        text: gall_bladderImage.organ
        color: root.organLabelColor(gall_bladderImage.organ)
        visible: root.displayOrganLabel
        font.pixelSize: 20
        x:0;y:0;z:0
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
        mouthImageLabel.text=root.coordinatesSheet.mouth.label
        mouthImageLabel.x=root.coordinatesSheet.mouth.labelcoordinates.x
        mouthImageLabel.y=root.coordinatesSheet.mouth.labelcoordinates.y
        mouthImageLabel.z=root.coordinatesSheet.mouth.labelcoordinates.z
        mouthImageLabel.font.pixelSize=root.coordinatesSheet.mouth.fontsize

        oesophagusImage.x = root.coordinatesSheet.oesophagus.coordinates.x;
        oesophagusImage.y = root.coordinatesSheet.oesophagus.coordinates.y;
        oesophagusImage.z = root.coordinatesSheet.oesophagus.coordinates.z;
        oesophagusImageLabel.text=root.coordinatesSheet.oesophagus.label
        oesophagusImageLabel.x=root.coordinatesSheet.oesophagus.labelcoordinates.x
        oesophagusImageLabel.y=root.coordinatesSheet.oesophagus.labelcoordinates.y
        oesophagusImageLabel.z=root.coordinatesSheet.oesophagus.labelcoordinates.z
        oesophagusImageLabel.font.pixelSize=root.coordinatesSheet.oesophagus.fontsize


        liverImage.x = root.coordinatesSheet.liver.coordinates.x;
        liverImage.y = root.coordinatesSheet.liver.coordinates.y;
        liverImage.z = root.coordinatesSheet.liver.coordinates.z;
        liverImageLabel.text=root.coordinatesSheet.liver.label
        liverImageLabel.x=root.coordinatesSheet.liver.labelcoordinates.x
        liverImageLabel.y=root.coordinatesSheet.liver.labelcoordinates.y
        liverImageLabel.z=root.coordinatesSheet.liver.labelcoordinates.z
        liverImageLabel.font.pixelSize=root.coordinatesSheet.liver.fontsize

        stomachImage.x = root.coordinatesSheet.stomach.coordinates.x;
        stomachImage.y = root.coordinatesSheet.stomach.coordinates.y;
        stomachImageLabel.text=root.coordinatesSheet.stomach.label
        stomachImageLabel.x=root.coordinatesSheet.stomach.labelcoordinates.x
        stomachImageLabel.y=root.coordinatesSheet.stomach.labelcoordinates.y
        stomachImageLabel.z=root.coordinatesSheet.stomach.labelcoordinates.z
        stomachImageLabel.font.pixelSize=root.coordinatesSheet.stomach.fontsize

        small_intestineImage.x = root.coordinatesSheet.small_intestine.coordinates.x;
        small_intestineImage.y = root.coordinatesSheet.small_intestine.coordinates.y;
        small_intestineImageLabel.text=root.coordinatesSheet.small_intestine.label
        small_intestineImageLabel.x=root.coordinatesSheet.small_intestine.labelcoordinates.x
        small_intestineImageLabel.y=root.coordinatesSheet.small_intestine.labelcoordinates.y
        small_intestineImageLabel.z=root.coordinatesSheet.small_intestine.labelcoordinates.z
        small_intestineImageLabel.font.pixelSize=root.coordinatesSheet.small_intestine.fontsize

        large_intestineImage.x = root.coordinatesSheet.large_intestine.coordinates.x;
        large_intestineImage.y = root.coordinatesSheet.large_intestine.coordinates.y;
        large_intestineImage.z = root.coordinatesSheet.large_intestine.coordinates.z;
        large_intestineImageLabel.text=root.coordinatesSheet.large_intestine.label
        large_intestineImageLabel.x=root.coordinatesSheet.large_intestine.labelcoordinates.x
        large_intestineImageLabel.y=root.coordinatesSheet.large_intestine.labelcoordinates.y
        large_intestineImageLabel.z=root.coordinatesSheet.large_intestine.labelcoordinates.z
        large_intestineImageLabel.font.pixelSize=root.coordinatesSheet.large_intestine.fontsize

        anusImage.x = root.coordinatesSheet.anus.coordinates.x;
        anusImage.y = root.coordinatesSheet.anus.coordinates.y;
        anusImageLabel.text=root.coordinatesSheet.anus.label
        anusImageLabel.x=root.coordinatesSheet.anus.labelcoordinates.x
        anusImageLabel.y=root.coordinatesSheet.anus.labelcoordinates.y
        anusImageLabel.z=root.coordinatesSheet.anus.labelcoordinates.z
        anusImageLabel.font.pixelSize=root.coordinatesSheet.anus.fontsize

        pancreasImage.x = root.coordinatesSheet.pancreas.coordinates.x;
        pancreasImage.y = root.coordinatesSheet.pancreas.coordinates.y;
        pancreasImage.z = root.coordinatesSheet.pancreas.coordinates.z;
        pancreasImageLabel.text=root.coordinatesSheet.pancreas.label
        pancreasImageLabel.x=root.coordinatesSheet.pancreas.labelcoordinates.x
        pancreasImageLabel.y=root.coordinatesSheet.pancreas.labelcoordinates.y
        pancreasImageLabel.z=root.coordinatesSheet.pancreas.labelcoordinates.z
        pancreasImageLabel.font.pixelSize=root.coordinatesSheet.pancreas.fontsize

        gall_bladderImage.x = root.coordinatesSheet.gall_bladder.coordinates.x;
        gall_bladderImage.y = root.coordinatesSheet.gall_bladder.coordinates.y;
        gall_bladderImage.z = root.coordinatesSheet.gall_bladder.coordinates.z;
        gall_bladderImageLabel.text=root.coordinatesSheet.gall_bladder.label
        gall_bladderImageLabel.x=root.coordinatesSheet.gall_bladder.labelcoordinates.x
        gall_bladderImageLabel.y=root.coordinatesSheet.gall_bladder.labelcoordinates.y
        gall_bladderImageLabel.z=root.coordinatesSheet.gall_bladder.labelcoordinates.z
        gall_bladderImageLabel.font.pixelSize=root.coordinatesSheet.gall_bladder.fontsize
    }
}
