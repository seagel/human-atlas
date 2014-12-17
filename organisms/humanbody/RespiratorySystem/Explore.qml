import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import QtMultimedia 5.0
import JSONReader 1.0

import components 1.0 as Components


Row {

    id: root

    property string organism
    property string organSystem
    property string currentOrgan: ""
    property string currentOrganDesc: "Click on a organ to see the description"
    property variant organData

    anchors.fill: parent

    JSONReader {
        id: myFile
        source: _organismsDataDirectory + "/" + root.organism + "/" + root.organSystem + "/" + "data.json"
        onError: console.log(msg);
    }
Rectangle {
    width:parent.width/2
    height: parent.height
    color: "#55ADAB"




    Organs {

        organism: root.organism
        organSystem: root.organSystem
        currentOrgan: root.currentOrgan

        onClicked: {
            root.currentOrgan = organ;
            root.currentOrganDesc = root.organData[organ].description;
            pronunciation.play();
        }


    }
    Item {
        height: 100
        width: 100

        x: 400
        y: 600



        Image {
            id: backimagebutton
            anchors.fill: parent
            source: "../../../back.png"
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
Rectangle {
    width:parent.width/2
    height: parent.height
    color: "#55ADAB"



    Text {
        id:organName
        width:parent.width-220
        height: 200
        text: root.organData[currentOrgan].label
        anchors{
            left:parent.left
            top:parent.top

        }
        font.pixelSize: 30
        wrapMode: Text.Wrap
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter

    }

    Image {
        id:organImage
        width: 200
        height: 200
        source: _organismsDataDirectory + "/" + root.organism + "/" + root.organSystem + "/" + root.currentOrgan + ".png"
        anchors{
            right:parent.right
            top: parent.top
            rightMargin: 20
        }
    }

    Text {
        id:organDesc
        width: parent.width-20
        height: 400
        wrapMode: Text.Wrap
        font.pixelSize: 18
        anchors{
            left:parent.left
            top: organName.bottom
            rightMargin: 20
        }

        text: root.currentOrganDesc
    }

}

    Audio {
        id: pronunciation
        source: root.currentOrgan + ".wav"
    }

    Component.onCompleted: {
        root.organData = JSON.parse(myFile.read());
    }


}
