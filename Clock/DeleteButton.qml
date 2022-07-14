import QtQuick

Rectangle {
    id: root

    signal click()

    anchors.centerIn: parent
    anchors.verticalCenterOffset: 340
    width: 434
    height: buttonHeight
    radius: buttonHeight/2

    visible: true

    border.color: "#EC6545"
    border.width: 1

    color: mouseArea.containsPress
           ? "#EC6545"
           :  "#151B2E"

    Behavior on color {
        ColorAnimation { duration: 250 }
    }

    Text {
        id: txt

        text: "DELETE"

        anchors.centerIn: parent

        color: mouseArea.containsPress
                ? "#151B2E"
                : "#EC6545"
        font.family: "Buenos Aires"
        font.pixelSize: 30
        font.letterSpacing: 1.8

        Behavior on color{
            ColorAnimation { duration: 250 }
        }
     }

     MouseArea {
         id: mouseArea
         anchors.fill: parent
         onClicked: root.click()
     }
}
