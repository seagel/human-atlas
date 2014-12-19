import QtQuick 2.0
import org.swecha.humanatlas 1.0

Image {
    id: root
    property string organ
    property bool dragOrgans: false
    property bool isCurrentOrgan: currentOrgan && currentOrgan === organ
    signal clicked
    signal selected(var organName)

    source: organism && organSystem ? _organismsDataDirectory + "/" + organism + "/" + organSystem + "/" + organ + ".png" : ""
    opacity: isCurrentOrgan ? 1 : 0.8
    smooth: true

    Drag.active: root.dragOrgans
    Drag.source: root

    ImageMouseArea {
        anchors.fill: parent
        imageName: parent.source
        onClicked: root.clicked(organ)
    }

    MouseArea {
        anchors.fill: parent
        drag.target: parent
        visible: root.dragOrgans
        onClicked: {
            root.selected(organ)
        }
        onReleased: {
            parent.Drag.drop();
            _globalDataStore.setOrgan(organ, root.x, root.y);
        }
    }

    Behavior on opacity {
        NumberAnimation { duration: 300 }
    }
}
