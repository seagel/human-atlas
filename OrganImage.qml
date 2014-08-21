import QtQuick 2.0

Image {
    property string organ
    property bool isCurrentOrgan: diagram.currentOrgan === organ

    source: "qrc:///" + organ + ".png"
    opacity: isCurrentOrgan ? 1 : 0.5
}
