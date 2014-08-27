import QtQuick 2.2
import QtQuick.Controls.Styles 1.2

ButtonStyle {
    background: Rectangle {
        implicitWidth: theme.buttonDefaultWidth
        implicitHeight: theme.buttonDefaultHeight
        border.width: control.activeFocus ? 2 : 1
        border.color: theme.buttonBackground
        radius: theme.buttonDefaultRadius
        gradient: Gradient {
            GradientStop { position: 0 ; color: control.pressed ? theme.highlightedButtonBackground : theme.buttonBackground }
            GradientStop { position: 1 ; color: control.pressed ? theme.highlightedButtonBackground : theme.buttonBackground }
        }
    }
    label: Text {
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        color: theme.buttonForeground
        font.pointSize: theme.buttonFontPointSize
        text: control.text
    }
}
