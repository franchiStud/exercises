import QtQuick

Rectangle { //DeveClock buttons
    id: root

    property string buttonTxt

    signal click

    anchors.verticalCenter: parent.verticalCenter
    anchors.verticalCenterOffset: 330
    width: 190
    height: buttonHeight
    radius: buttonHeight/2

    border.color: "#FCB647"
    border.width: 1

    color: mouseArea.containsPress
            ? "#FCB647"
            : "#151B2"

    Behavior on color {
       ColorAnimation { duration: 250 }
    }

    Text {
        id: txt

        text: root.buttonTxt

        anchors.centerIn: parent

        font.family: "Buenos Aires"
        font.pixelSize: 30
        font.letterSpacing: 1.8

        color: mouseArea.containsPress
                ? "#151B2"
                : "#FCB647"

        Behavior on color {
            ColorAnimation { duration: 250 }
        }
    }
    MouseArea {
        id: mouseArea

        anchors.fill: parent

        onClicked: root.click()
    }
}
