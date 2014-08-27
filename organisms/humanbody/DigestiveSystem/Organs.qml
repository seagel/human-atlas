import QtQuick 2.0
import components 1.0 as Components

Item {
    id: root
    property string organism
    property string organSystem
    property string currentOrgan

    signal clicked(var organ)

    Components.OrganImage {
        id: liverImage
        organ: "liver"
        x: 50
        y: 70
        z: 1

        onClicked: root.clicked(organ)
    }

    Components.OrganImage {
        id: intestineImage
        organ: "intestine"
        x: 120
        y: 90

        onClicked: root.clicked(organ)
    }

    Components.OrganImage {
        id: stomachImage
        organ: "stomach"
        x: 170
        y: 20

        onClicked: root.clicked(organ)
    }
}
