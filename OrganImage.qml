import QtQuick 2.0
import org.swecha.humanatlas 1.0

Image {
    property string organ
    property bool isCurrentOrgan: diagram.currentOrgan === organ

    source: "qrc:///" + organ + ".png"
    opacity: isCurrentOrgan ? 1 : 0.5

    ImageMouseArea {
        anchors.fill: parent

        imageName: parent.source
        onClicked: diagram.currentOrgan = parent.organ
    }

    Behavior on opacity {
        NumberAnimation { duration: 300 }
    }
}
