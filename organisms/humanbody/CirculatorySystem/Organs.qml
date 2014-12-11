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
            topMargin: 120
        }
        source: _organismsDataDirectory + "/" + root.organism + "/" + root.organSystem + "/background.png"
        z: 0
    }

    JSONReader {
        id: myFile
        source: _organismsDataDirectory + "/" + root.organism + "/" + root.organSystem + "/" + "data.json"
        onError: console.log(msg);
    }

    signal clicked(var organ)

    Components.OrganImage {
        id: aortaImage
        organ: "aorta"
        dragOrgans: root.dragOrgans
        x: 0
        y: 0
        z: 0

        onClicked: root.clicked(organ)
    }

    Components.OrganImage {
        id: inferior_vena_cavaImage
        organ: "inferior_vena_cava"
        dragOrgans: root.dragOrgans
        x: 0
        y: 0
        z: 0

        onClicked: root.clicked(organ)
    }

    Components.OrganImage {
        id: left_atriumImage
        organ: "left_atrium"
        dragOrgans: root.dragOrgans
        x: 0
        y: 0
        z: 0

        onClicked: root.clicked(organ)
    }

    Components.OrganImage {
        id: left_pulmonary_artriesImage
        organ: "left_pulmonary_artries"
        dragOrgans: root.dragOrgans
        x: 0
        y: 0

        onClicked: root.clicked(organ)
    }

    Components.OrganImage {
        id: left_pulmonary_veinsImage
        organ: "left_pulmonary_veins"
        dragOrgans: root.dragOrgans
        x: 0
        y: 0

        onClicked: root.clicked(organ)
    }

    Components.OrganImage {
        id: left_ventricleImage
        organ: "left_ventricle"
        dragOrgans: root.dragOrgans
        x: 0
        y: 0
        z: 0

        onClicked: root.clicked(organ)
    }

    Components.OrganImage {
        id: pulmonary_valvesImage
        organ: "pulmonary_valves"
        dragOrgans: root.dragOrgans
        x: 0
        y: 0

        onClicked: root.clicked(organ)
    }

    Components.OrganImage {
        id: right_atriumImage
        organ: "right_atrium"
        dragOrgans: root.dragOrgans
        x: 0
        y: 0
        z: 0

        onClicked: root.clicked(organ)
    }

    Components.OrganImage {
        id: right_pulmonary_artriesImage
        organ: "right_pulmonary_artries"
        dragOrgans: root.dragOrgans
        x: 0
        y: 0
        z: 0

        onClicked: root.clicked(organ)
    }

    Components.OrganImage {
        id: right_pulmonary_veinsImage
        organ: "right_pulmonary_veins"
        dragOrgans: root.dragOrgans
        x: 0
        y: 0
        z: 0

        onClicked: root.clicked(organ)
    }

    Components.OrganImage {
        id: right_ventricleImage
        organ: "right_ventricle"
        dragOrgans: root.dragOrgans
        x: 0
        y: 0
        z: 0

        onClicked: root.clicked(organ)
    }

    Components.OrganImage {
        id: superior_vena_cavaImage
        organ: "superior_vena_cava"
        dragOrgans: root.dragOrgans
        x: 0
        y: 0
        z: 0

        onClicked: root.clicked(organ)
    }

    Text {
        id: aortaImageLabel
        text: aortaImage.organ
        color: root.organLabelColor(aortaImage.organ)
        visible: root.displayOrganLabel
        font.pixelSize: 20
        x:0;y:0;z:0
    }

    Text {
        id: inferior_vena_cavaImageLabel
        text: inferior_vena_cavaImage.organ
        color: root.organLabelColor(inferior_vena_cavaImage.organ)
        visible: root.displayOrganLabel
        font.pixelSize: 20
        x:0;y:0;z:0
    }

    Text {
        id: left_atriumImageLabel
        text: left_atriumImage.organ
        color: root.organLabelColor(left_atriumImage.organ)
        visible: root.displayOrganLabel
        font.pixelSize: 20
        x:0;y:0;z:0
    }

    Text {
        id: left_pulmonary_artriesImageLabel
        text: left_pulmonary_artriesImage.organ
        color: root.organLabelColor(left_pulmonary_artriesImage.organ)
        visible: root.displayOrganLabel
        font.pixelSize: 20
        x:0;y:0;z:0
    }

    Text {
        id: left_pulmonary_veinsImageLabel
        text: left_pulmonary_veinsImage.organ
        color: root.organLabelColor(left_pulmonary_veinsImage.organ)
        visible: root.displayOrganLabel
        font.pixelSize: 20
        x:0;y:0;z:0
    }

    Text {
        id: left_ventricleImageLabel
        text: left_ventricleImage.organ
        color: root.organLabelColor(left_ventricleImage.organ)
        visible: root.displayOrganLabel
        font.pixelSize: 20
        x:0;y:0;z:0
    }

    Text {
        id: pulmonary_valvesImageLabel
        text: pulmonary_valvesImage.organ
        color: root.organLabelColor(pulmonary_valvesImage.organ)
        visible: root.displayOrganLabel
        font.pixelSize: 20
        x:0;y:0;z:0
    }

    Text {
        id: right_atriumImageLabel
        text: left_atriumImage.organ
        color: root.organLabelColor(left_atriumImage.organ)
        visible: root.displayOrganLabel
        font.pixelSize: 20
        x:0;y:0;z:0
    }

    Text {
        id: right_pulmonary_artriesImageLabel
        text: right_pulmonary_artriesImage.organ
        color: root.organLabelColor(right_pulmonary_artriesImage.organ)
        visible: root.displayOrganLabel
        font.pixelSize: 20
        x:0;y:0;z:0
    }

    Text {
        id: right_pulmonary_veinsImageLabel
        text: right_pulmonary_veinsImage.organ
        color: root.organLabelColor(right_pulmonary_veinsImage.organ)
        visible: root.displayOrganLabel
        font.pixelSize: 20
        x:0;y:0;z:0
    }

    Text {
        id: right_ventricleImageLabel
        text: right_ventricleImage.organ
        color: root.organLabelColor(right_ventricleImage.organ)
        visible: root.displayOrganLabel
        font.pixelSize: 20
        x:0;y:0;z:0
    }

    Text {
        id: superior_vena_cavaImageLabel
        text: superior_vena_cavaImage.organ
        color: root.organLabelColor(superior_vena_cavaImage.organ)
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

        aortaImage.x = root.coordinatesSheet.aorta.coordinates.x;
        aortaImage.y = root.coordinatesSheet.aorta.coordinates.y;
        aortaImage.z = root.coordinatesSheet.aorta.coordinates.z;
        aortaImageLabel.text=root.coordinatesSheet.aorta.label
        aortaImageLabel.x=root.coordinatesSheet.aorta.labelcoordinates.x
        aortaImageLabel.y=root.coordinatesSheet.aorta.labelcoordinates.y
        aortaImageLabel.z=root.coordinatesSheet.aorta.labelcoordinates.z
        aortaImageLabel.font.pixelSize=root.coordinatesSheet.aorta.fontsize

        inferior_vena_cavaImage.x = root.coordinatesSheet.inferior_vena_cava.coordinates.x;
        inferior_vena_cavaImage.y = root.coordinatesSheet.inferior_vena_cava.coordinates.y;
        inferior_vena_cavaImage.z = root.coordinatesSheet.inferior_vena_cava.coordinates.z;
        inferior_vena_cavaImageLabel.text=root.coordinatesSheet.inferior_vena_cava.label
        inferior_vena_cavaImageLabel.x=root.coordinatesSheet.inferior_vena_cava.labelcoordinates.x
        inferior_vena_cavaImageLabel.y=root.coordinatesSheet.inferior_vena_cava.labelcoordinates.y
        inferior_vena_cavaImageLabel.z=root.coordinatesSheet.inferior_vena_cava.labelcoordinates.z
        inferior_vena_cavaImageLabel.font.pixelSize=root.coordinatesSheet.inferior_vena_cava.fontsize


        left_atriumImage.x = root.coordinatesSheet.left_atrium.coordinates.x;
        left_atriumImage.y = root.coordinatesSheet.left_atrium.coordinates.y;
        left_atriumImage.z = root.coordinatesSheet.left_atrium.coordinates.z;
        left_atriumImageLabel.text=root.coordinatesSheet.left_atrium.label
        left_atriumImageLabel.x=root.coordinatesSheet.left_atrium.labelcoordinates.x
        left_atriumImageLabel.y=root.coordinatesSheet.left_atrium.labelcoordinates.y
        left_atriumImageLabel.z=root.coordinatesSheet.left_atrium.labelcoordinates.z
        left_atriumImageLabel.font.pixelSize=root.coordinatesSheet.left_atrium.fontsize

        left_pulmonary_artriesImage.x = root.coordinatesSheet.left_pulmonary_artries.coordinates.x;
        left_pulmonary_artriesImage.y = root.coordinatesSheet.left_pulmonary_artries.coordinates.y;
        left_pulmonary_artriesImageLabel.text=root.coordinatesSheet.left_pulmonary_artries.label
        left_pulmonary_artriesImageLabel.x=root.coordinatesSheet.left_pulmonary_artries.labelcoordinates.x
        left_pulmonary_artriesImageLabel.y=root.coordinatesSheet.left_pulmonary_artries.labelcoordinates.y
        left_pulmonary_artriesImageLabel.z=root.coordinatesSheet.left_pulmonary_artries.labelcoordinates.z
        left_pulmonary_artriesImageLabel.font.pixelSize=root.coordinatesSheet.left_pulmonary_artries.fontsize

        left_pulmonary_veinsImage.x = root.coordinatesSheet.left_pulmonary_veins.coordinates.x;
        left_pulmonary_veinsImage.y = root.coordinatesSheet.left_pulmonary_veins.coordinates.y;
        left_pulmonary_veinsImageLabel.text=root.coordinatesSheet.left_pulmonary_veins.label
        left_pulmonary_veinsImageLabel.x=root.coordinatesSheet.left_pulmonary_veins.labelcoordinates.x
        left_pulmonary_veinsImageLabel.y=root.coordinatesSheet.left_pulmonary_veins.labelcoordinates.y
        left_pulmonary_veinsImageLabel.z=root.coordinatesSheet.left_pulmonary_veins.labelcoordinates.z
        left_pulmonary_veinsImageLabel.font.pixelSize=root.coordinatesSheet.left_pulmonary_veins.fontsize

        left_ventricleImage.x = root.coordinatesSheet.left_ventricle.coordinates.x;
        left_ventricleImage.y = root.coordinatesSheet.left_ventricle.coordinates.y;
        left_ventricleImage.z = root.coordinatesSheet.left_ventricle.coordinates.z;
        left_ventricleImageLabel.text=root.coordinatesSheet.left_ventricle.label
        left_ventricleImageLabel.x=root.coordinatesSheet.left_ventricle.labelcoordinates.x
        left_ventricleImageLabel.y=root.coordinatesSheet.left_ventricle.labelcoordinates.y
        left_ventricleImageLabel.z=root.coordinatesSheet.left_ventricle.labelcoordinates.z
        left_ventricleImageLabel.font.pixelSize=root.coordinatesSheet.left_ventricle.fontsize

        pulmonary_valvesImage.x = root.coordinatesSheet.pulmonary_valves.coordinates.x;
        pulmonary_valvesImage.y = root.coordinatesSheet.pulmonary_valves.coordinates.y;
        pulmonary_valvesImageLabel.text=root.coordinatesSheet.pulmonary_valves.label
        pulmonary_valvesImageLabel.x=root.coordinatesSheet.pulmonary_valves.labelcoordinates.x
        pulmonary_valvesImageLabel.y=root.coordinatesSheet.pulmonary_valves.labelcoordinates.y
        pulmonary_valvesImageLabel.z=root.coordinatesSheet.pulmonary_valves.labelcoordinates.z
        pulmonary_valvesImageLabel.font.pixelSize=root.coordinatesSheet.pulmonary_valves.fontsize

        right_atriumImage.x = root.coordinatesSheet.right_atrium.coordinates.x;
        right_atriumImage.y = root.coordinatesSheet.right_atrium.coordinates.y;
        right_atriumImage.z = root.coordinatesSheet.right_atrium.coordinates.z;
        right_atriumImageLabel.text=root.coordinatesSheet.right_atrium.label
        right_atriumImageLabel.x=root.coordinatesSheet.right_atrium.labelcoordinates.x
        right_atriumImageLabel.y=root.coordinatesSheet.right_atrium.labelcoordinates.y
        right_atriumImageLabel.z=root.coordinatesSheet.right_atrium.labelcoordinates.z
        right_atriumImageLabel.font.pixelSize=root.coordinatesSheet.right_atrium.fontsize

        right_pulmonary_artriesImage.x = root.coordinatesSheet.right_pulmonary_artries.coordinates.x;
        right_pulmonary_artriesImage.y = root.coordinatesSheet.right_pulmonary_artries.coordinates.y;
        right_pulmonary_artriesImage.z = root.coordinatesSheet.right_pulmonary_artries.coordinates.z;
        right_pulmonary_artriesImageLabel.text=root.coordinatesSheet.right_pulmonary_artries.label
        right_pulmonary_artriesImageLabel.x=root.coordinatesSheet.right_pulmonary_artries.labelcoordinates.x
        right_pulmonary_artriesImageLabel.y=root.coordinatesSheet.right_pulmonary_artries.labelcoordinates.y
        right_pulmonary_artriesImageLabel.z=root.coordinatesSheet.right_pulmonary_artries.labelcoordinates.z
        right_pulmonary_artriesImageLabel.font.pixelSize=root.coordinatesSheet.right_pulmonary_artries.fontsize

        right_pulmonary_veinsImage.x = root.coordinatesSheet.right_pulmonary_veins.coordinates.x;
        right_pulmonary_veinsImage.y = root.coordinatesSheet.right_pulmonary_veins.coordinates.y;
        right_pulmonary_veinsImage.z = root.coordinatesSheet.right_pulmonary_veins.coordinates.z;
        right_pulmonary_veinsImageLabel.text=root.coordinatesSheet.right_pulmonary_veins.label
        right_pulmonary_veinsImageLabel.x=root.coordinatesSheet.right_pulmonary_veins.labelcoordinates.x
        right_pulmonary_veinsImageLabel.y=root.coordinatesSheet.right_pulmonary_veins.labelcoordinates.y
        right_pulmonary_veinsImageLabel.z=root.coordinatesSheet.right_pulmonary_veins.labelcoordinates.z
        right_pulmonary_veinsImageLabel.font.pixelSize=root.coordinatesSheet.right_pulmonary_veins.fontsize

        right_ventricleImage.x = root.coordinatesSheet.right_ventricle.coordinates.x;
        right_ventricleImage.y = root.coordinatesSheet.right_ventricle.coordinates.y;
        right_ventricleImage.z = root.coordinatesSheet.right_ventricle.coordinates.z;
        right_ventricleImageLabel.text=root.coordinatesSheet.right_ventricle.label
        right_ventricleImageLabel.x=root.coordinatesSheet.right_ventricle.labelcoordinates.x
        right_ventricleImageLabel.y=root.coordinatesSheet.right_ventricle.labelcoordinates.y
        right_ventricleImageLabel.z=root.coordinatesSheet.right_ventricle.labelcoordinates.z
        right_ventricleImageLabel.font.pixelSize=root.coordinatesSheet.right_ventricle.fontsize

        superior_vena_cavaImage.x = root.coordinatesSheet.superior_vena_cava.coordinates.x;
        superior_vena_cavaImage.y = root.coordinatesSheet.superior_vena_cava.coordinates.y;
        superior_vena_cavaImage.z = root.coordinatesSheet.superior_vena_cava.coordinates.z;
        superior_vena_cavaImageLabel.text=root.coordinatesSheet.superior_vena_cava.label
        superior_vena_cavaImageLabel.x=root.coordinatesSheet.superior_vena_cava.labelcoordinates.x
        superior_vena_cavaImageLabel.y=root.coordinatesSheet.superior_vena_cava.labelcoordinates.y
        superior_vena_cavaImageLabel.z=root.coordinatesSheet.superior_vena_cava.labelcoordinates.z
        superior_vena_cavaImageLabel.font.pixelSize=root.coordinatesSheet.superior_vena_cava.fontsize
    }
}
