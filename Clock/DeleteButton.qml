import QtQuick

Rectangle {
    id: root

    anchors.centerIn: parent
    anchors.verticalCenterOffset: 340
    width: 434
    height: buttonHeight

    visible: true
    border.color: "#EC6545"
    border.width: 1
    radius: 32
    color: "transparent"

    Behavior on color {
        ColorAnimation { duration: 250 }
    }

    Text {
        id: txt

        text: "DELETE"

        anchors.centerIn: parent

        color: "#EC6545"
        font.family: "Buenos Aires"
        font.pixelSize: 30
        font.letterSpacing: 1.8

        Behavior on color{
            ColorAnimation { duration: 250 }
        }
     }
     states: [
         State {
             name: "enabled"
             PropertyChanges {
                 target: root
                 color: "#EC6545"
             }
             PropertyChanges {
                 target: txt
                 color: "#151B2E"
             }
         },
         State {
             name: "disabled"
             PropertyChanges {
                 target: root
                 color: "#151B2E"
             }
             PropertyChanges {
                 target: txt
                 color: "#EC6545"
             }
         }
     ]
}
