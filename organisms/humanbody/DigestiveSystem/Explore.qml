import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import QtMultimedia 5.0
import JSONReader 1.0

import components 1.0 as Components

RowLayout {
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

    Organs {
        Layout.fillWidth: true
        Layout.maximumWidth: 400
        Layout.fillHeight: true

        anchors {
            left: parent.left
            leftMargin: 10
        }

        organism: root.organism
        organSystem: root.organSystem
        currentOrgan: root.currentOrgan

        onClicked: {
            root.currentOrgan = organ;
            root.currentOrganDesc = root.organData[organ].description;
            pronunciation.play();
        }

        Button {
            text: "Back"
            style: Components.ButtonStyle {}
            width: 50
            height: 50
            x: 750
            y: 700

            onClicked: {
                stack.push(modeSelection)
            }
        }
    }

    Rectangle {
        id:organNameRectangle
//      anchors {
//        right: parent.right;
//        top:parent.top
//        topMargin: 100
//        rightMargin: 90
//        margins: 50;
//        }

      border.width: 3
      border.color: "black"
      x:0;y:0
//      visible:false

      height: 100; width: 200

      Text {
            id: organName
            font.bold: true
            font.pixelSize: 30
            text: root.currentOrgan
            wrapMode: Text.WordWrap
            width:380
            anchors{
                top:parent.top
                topMargin: 20
                left:parent.left
                leftMargin: 20

            }
      }
    }

    Rectangle {
        id:organImageRectangle
      anchors {
        left: organNameRectangle.right;
        top:parent.top
        topMargin: 100
        rightMargin: 90
        margins: 50;

        }
      //color:"green"
      radius: 30
      border.width: 3
      border.color: "black"
                        height: 200; width: 400
//     visible: false
          Image {
//              Layout.fillWidth: true
//              Layout.maximumWidth: 170
              anchors {
                  left: parent.left
                  top: parent.top
                  //leftMargin: 700
                  //topMargin: 100
              }
              anchors.fill: parent
              source: _organismsDataDirectory + "/" + root.organism + "/" + root.organSystem + "/" + root.currentOrgan + ".png"
          }
    }

//    Text {
//        Layout.fillWidth: true
//        Layout.maximumWidth: 170
//        anchors {
//            left: parent.left
//            top: parent.top
//            leftMargin: 800
//            topMargin: 50
//        }
//        text: root.currentOrgan
//    }

//    Image {
//        Layout.fillWidth: true
//        Layout.maximumWidth: 170
//        anchors {
//            left: parent.left
//            top: parent.top
//            leftMargin: 700
//            topMargin: 100
//        }
//        source: _organismsDataDirectory + "/" + root.organism + "/" + root.organSystem + "/" + root.currentOrgan + ".png"
//    }

    Rectangle {
        id:organDescRectangle
      anchors {
        right: parent.right;
        top:parent.top
        topMargin: 100
        rightMargin: 90
        margins: 50;
        }
      radius: 30
      border.width: 3
      border.color: "black"


      height: 200; width: 400
      visible:false

      //spacing: 5

      Text {
            id: organDesc
            font.bold: true
            font.pixelSize: 30
            text: root.currentOrganDesc
            wrapMode: Text.WordWrap
            width:380
            anchors{
                top:parent.top
                topMargin: 20
                left:parent.left
                leftMargin: 20

            }
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
