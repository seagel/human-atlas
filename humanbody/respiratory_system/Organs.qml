import QtQuick 2.0
import components 1.0 as Components

Rectangle {
    id: root
    property string currentOrgan
    property string organSystem: "respiratory_system"
    color: "lightsteelblue"

    Components.OrganImage {
        organSystem: root.organSystem
        organ: "lungs"
        x: 120
        y: 90
    }
}
