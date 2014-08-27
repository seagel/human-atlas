import QtQuick 2.0
import org.swecha.humanatlas 1.0

Image {
    id: root
    property string organ
    property bool isCurrentOrgan: currentOrgan && currentOrgan === organ

    signal clicked

    source: organism && organSystem ? _organismsDataDirectory + "/" + organism + "/" + organSystem + "/" + organ + ".png" : ""
    opacity: isCurrentOrgan ? 1 : 0.8
    smooth: true

    ImageMouseArea {
        anchors.fill: parent

        imageName: parent.source
        onClicked: root.clicked(organ)
    }

    Behavior on opacity {
        NumberAnimation { duration: 300 }
    }
}
