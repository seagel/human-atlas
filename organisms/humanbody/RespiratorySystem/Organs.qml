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
    property variant organsList: ["bronchi_left", "bronchi_right", "bronchioles", "diaphragm", "epiglottis","lungs", "nose","oral_cavity", "ribs", "trachea" ]

    Image {
        anchors {
            left: parent.left
            top: parent.top
            leftMargin: -45
            topMargin: 0
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
        id: bronchi_leftImage
        organ: "bronchi_left"
        dragOrgans: root.dragOrgans
        x: 0
        y: 0
        z: 0

        onClicked: root.clicked(organ)
    }

    Components.OrganImage {
        id: bronchi_rightImage
        organ: "bronchi_right"
        dragOrgans: root.dragOrgans
        x: 0
        y: 0
        z: 0

        onClicked: root.clicked(organ)
    }

    Components.OrganImage {
        id: bronchiolesImage
        organ: "bronchioles"
        dragOrgans: root.dragOrgans
        x: 0
        y: 0
        z: 0

        onClicked: root.clicked(organ)
    }

    Components.OrganImage {
        id: diaphragmImage
        organ: "diaphragm"
        dragOrgans: root.dragOrgans
        x: 0
        y: 0

        onClicked: root.clicked(organ)
    }

    Components.OrganImage {
        id: epiglottisImage
        organ: "epiglottis"
        dragOrgans: root.dragOrgans
        x: 0
        y: 0

        onClicked: root.clicked(organ)
    }

    Components.OrganImage {
        id: lungsImage
        organ: "lungs"
        dragOrgans: root.dragOrgans
        x: 0
        y: 0
        z: 0

        onClicked: root.clicked(organ)
    }

    Components.OrganImage {
        id: noseImage
        organ: "nose"
        dragOrgans: root.dragOrgans
        x: 0
        y: 0
        z: 0

        onClicked: root.clicked(organ)
    }

    Components.OrganImage {
        id: oral_cavityImage
        organ: "oral_cavity"
        dragOrgans: root.dragOrgans
        x: 0
        y: 0
        z: 0

        onClicked: root.clicked(organ)
    }

    Components.OrganImage {
        id: ribsImage
        organ: "ribs"
        dragOrgans: root.dragOrgans
        x: 0
        y: 0
        z: 0

        onClicked: root.clicked(organ)
    }

    Components.OrganImage {
        id: tracheaImage
        organ: "trachea"
        dragOrgans: root.dragOrgans
        x: 0
        y: 0
        z: 0

        onClicked: root.clicked(organ)
    }

    Text {
        id: bronchi_leftImageLabel
        text: bronchi_leftImage.organ
        color: root.organLabelColor(bronchi_leftImage.organ)
        visible: root.displayOrganLabel
        font.pixelSize: 20
        x:0;y:0;z:0
    }

    Text {
        id: bronchi_rightImageLabel
        text: bronchi_rightImage.organ
        color: root.organLabelColor(bronchi_rightImage.organ)
        visible: root.displayOrganLabel
        font.pixelSize: 20
        x:0;y:0;z:0
    }

    Text {
        id: bronchiolesImageLabel
        text: bronchiolesImage.organ
        color: root.organLabelColor(bronchiolesImage.organ)
        visible: root.displayOrganLabel
        font.pixelSize: 20
        x:0;y:0;z:0
    }

    Text {
        id: diaphragmImageLabel
        text: diaphragmImage.organ
        color: root.organLabelColor(diaphragmImage.organ)
        visible: root.displayOrganLabel
        font.pixelSize: 20
        x:0;y:0;z:0
    }

    Text {
        id: epiglottisImageLabel
        text: epiglottisImage.organ
        color: root.organLabelColor(epiglottisImage.organ)
        visible: root.displayOrganLabel
        font.pixelSize: 20
        x:0;y:0;z:0
    }

    Text {
        id: lungsImageLabel
        text: lungsImage.organ
        color: root.organLabelColor(lungsImage.organ)
        visible: root.displayOrganLabel
        font.pixelSize: 20
        x:0;y:0;z:0
    }

    Text {
        id: noseImageLabel
        text: noseImage.organ
        color: root.organLabelColor(noseImage.organ)
        visible: root.displayOrganLabel
        font.pixelSize: 20
        x:0;y:0;z:0
    }

    Text {
        id: oral_cavityImageLabel
        text: oral_cavityImage.organ
        color: root.organLabelColor(oral_cavityImage.organ)
        visible: root.displayOrganLabel
        font.pixelSize: 20
        x:0;y:0;z:0
    }

    Text {
        id: ribsImageLabel
        text: ribsImage.organ
        color: root.organLabelColor(ribsImage.organ)
        visible: root.displayOrganLabel
        font.pixelSize: 20
        x:0;y:0;z:0
    }

    Text {
        id: tracheaImageLabel
        text: tracheaImage.organ
        color: root.organLabelColor(tracheaImage.organ)
        visible: root.displayOrganLabel
        font.pixelSize: 20
        x:0;y:0;z:0
    }
    
      Repeater{
        model:getModel()
        Image {




            source: root.coordinatesSheet.lines[modelData + "Line"].source
            x:root.coordinatesSheet.lines[modelData + "Line"].coordinates.x;
            y:root.coordinatesSheet.lines[modelData + "Line"].coordinates.y
            z:root.coordinatesSheet.lines[modelData + "Line"].coordinates.z
            width:root.coordinatesSheet.lines[modelData + "Line"].width
            visible: root.displayOrganLabel
            Image {

                source: root.coordinatesSheet.lines[modelData + "Line"].sourceArrow
                x:root.coordinatesSheet.lines[modelData + "Line"].coordinatesArrow.x;
                y:root.coordinatesSheet.lines[modelData + "Line"].coordinatesArrow.y
                z:root.coordinatesSheet.lines[modelData + "Line"].coordinatesArrow.z
                width:root.coordinatesSheet.lines[modelData + "Line"].widthArrow
                visible: root.displayOrganLabel

            }

        }
        function getModel(){
            root.coordinatesSheet = JSON.parse(myFile.read());

            return organsList
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

        bronchi_leftImage.x = root.coordinatesSheet.bronchi_left.coordinates.x;
        bronchi_leftImage.y = root.coordinatesSheet.bronchi_left.coordinates.y;
        bronchi_leftImage.z = root.coordinatesSheet.bronchi_left.coordinates.z;
        bronchi_leftImageLabel.text=root.coordinatesSheet.bronchi_left.label
        bronchi_leftImageLabel.x=root.coordinatesSheet.bronchi_left.labelcoordinates.x
        bronchi_leftImageLabel.y=root.coordinatesSheet.bronchi_left.labelcoordinates.y
        bronchi_leftImageLabel.z=root.coordinatesSheet.bronchi_left.labelcoordinates.z
        bronchi_leftImageLabel.font.pixelSize=root.coordinatesSheet.bronchi_left.fontsize

        bronchi_rightImage.x = root.coordinatesSheet.bronchi_right.coordinates.x;
        bronchi_rightImage.y = root.coordinatesSheet.bronchi_right.coordinates.y;
        bronchi_rightImage.z = root.coordinatesSheet.bronchi_right.coordinates.z;
        bronchi_rightImageLabel.text=root.coordinatesSheet.bronchi_right.label
        bronchi_rightImageLabel.x=root.coordinatesSheet.bronchi_right.labelcoordinates.x
        bronchi_rightImageLabel.y=root.coordinatesSheet.bronchi_right.labelcoordinates.y
        bronchi_rightImageLabel.z=root.coordinatesSheet.bronchi_right.labelcoordinates.z
        bronchi_rightImageLabel.font.pixelSize=root.coordinatesSheet.bronchi_right.fontsize

        bronchiolesImage.x = root.coordinatesSheet.bronchioles.coordinates.x;
        bronchiolesImage.y = root.coordinatesSheet.bronchioles.coordinates.y;
        bronchiolesImage.z = root.coordinatesSheet.bronchioles.coordinates.z;
        bronchiolesImageLabel.text=root.coordinatesSheet.bronchioles.label
        bronchiolesImageLabel.x=root.coordinatesSheet.bronchioles.labelcoordinates.x
        bronchiolesImageLabel.y=root.coordinatesSheet.bronchioles.labelcoordinates.y
        bronchiolesImageLabel.z=root.coordinatesSheet.bronchioles.labelcoordinates.z
        bronchiolesImageLabel.font.pixelSize=root.coordinatesSheet.bronchioles.fontsize

        diaphragmImage.x = root.coordinatesSheet.diaphragm.coordinates.x;
        diaphragmImage.y = root.coordinatesSheet.diaphragm.coordinates.y;
        diaphragmImageLabel.text=root.coordinatesSheet.diaphragm.label
        diaphragmImageLabel.x=root.coordinatesSheet.diaphragm.labelcoordinates.x
        diaphragmImageLabel.y=root.coordinatesSheet.diaphragm.labelcoordinates.y
        diaphragmImageLabel.z=root.coordinatesSheet.diaphragm.labelcoordinates.z
        diaphragmImageLabel.font.pixelSize=root.coordinatesSheet.diaphragm.fontsize

        epiglottisImage.x = root.coordinatesSheet.epiglottis.coordinates.x;
        epiglottisImage.y = root.coordinatesSheet.epiglottis.coordinates.y;
        epiglottisImageLabel.text=root.coordinatesSheet.epiglottis.label
        epiglottisImageLabel.x=root.coordinatesSheet.epiglottis.labelcoordinates.x
        epiglottisImageLabel.y=root.coordinatesSheet.epiglottis.labelcoordinates.y
        epiglottisImageLabel.z=root.coordinatesSheet.epiglottis.labelcoordinates.z
        epiglottisImageLabel.font.pixelSize=root.coordinatesSheet.epiglottis.fontsize

        lungsImage.x = root.coordinatesSheet.lungs.coordinates.x;
        lungsImage.y = root.coordinatesSheet.lungs.coordinates.y;
        lungsImage.z = root.coordinatesSheet.lungs.coordinates.z;
        lungsImageLabel.text=root.coordinatesSheet.lungs.label
        lungsImageLabel.x=root.coordinatesSheet.lungs.labelcoordinates.x
        lungsImageLabel.y=root.coordinatesSheet.lungs.labelcoordinates.y
        lungsImageLabel.z=root.coordinatesSheet.lungs.labelcoordinates.z
        lungsImageLabel.font.pixelSize=root.coordinatesSheet.lungs.fontsize

        noseImage.x = root.coordinatesSheet.nose.coordinates.x;
        noseImage.y = root.coordinatesSheet.nose.coordinates.y;
        noseImage.z = root.coordinatesSheet.nose.coordinates.z;
        noseImageLabel.text=root.coordinatesSheet.nose.label
        noseImageLabel.x=root.coordinatesSheet.nose.labelcoordinates.x
        noseImageLabel.y=root.coordinatesSheet.nose.labelcoordinates.y
        noseImageLabel.z=root.coordinatesSheet.nose.labelcoordinates.z
        noseImageLabel.font.pixelSize=root.coordinatesSheet.nose.fontsize

        oral_cavityImage.x = root.coordinatesSheet.oral_cavity.coordinates.x;
        oral_cavityImage.y = root.coordinatesSheet.oral_cavity.coordinates.y;
        oral_cavityImage.z = root.coordinatesSheet.oral_cavity.coordinates.z;
        oral_cavityImageLabel.text=root.coordinatesSheet.oral_cavity.label
        oral_cavityImageLabel.x=root.coordinatesSheet.oral_cavity.labelcoordinates.x
        oral_cavityImageLabel.y=root.coordinatesSheet.oral_cavity.labelcoordinates.y
        oral_cavityImageLabel.z=root.coordinatesSheet.oral_cavity.labelcoordinates.z
        oral_cavityImageLabel.font.pixelSize=root.coordinatesSheet.oral_cavity.fontsize

        ribsImage.x = root.coordinatesSheet.ribs.coordinates.x;
        ribsImage.y = root.coordinatesSheet.ribs.coordinates.y;
        ribsImageLabel.text=root.coordinatesSheet.ribs.label
        ribsImageLabel.x=root.coordinatesSheet.ribs.labelcoordinates.x
        ribsImageLabel.y=root.coordinatesSheet.ribs.labelcoordinates.y
        ribsImageLabel.z=root.coordinatesSheet.ribs.labelcoordinates.z
        ribsImageLabel.font.pixelSize=root.coordinatesSheet.ribs.fontsize

        tracheaImage.x = root.coordinatesSheet.trachea.coordinates.x;
        tracheaImage.y = root.coordinatesSheet.trachea.coordinates.y;
        tracheaImageLabel.text=root.coordinatesSheet.trachea.label
        tracheaImageLabel.x=root.coordinatesSheet.trachea.labelcoordinates.x
        tracheaImageLabel.y=root.coordinatesSheet.trachea.labelcoordinates.y
        tracheaImageLabel.z=root.coordinatesSheet.trachea.labelcoordinates.z
        tracheaImageLabel.font.pixelSize=root.coordinatesSheet.trachea.fontsize
    }
}
