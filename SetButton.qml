import QtQuick

Rectangle {
   id: root
   property string buttonTxt
   x: 23
   y: 706
   width: 434
   height: 64
   visible: true
   border.color: "#00A6E2"
   border.width: 1
   radius: 32
   Text {
       id: txt
       color: "#00A6E2"
       anchors.centerIn: parent
       font.family: "Buenos Aires"
       font.pixelSize: 36
       font.letterSpacing: 1.8
       text: buttonTxt
    }
    states: [
        State { //stato del pulsante active
            name: "active"
            PropertyChanges {
                target: txt
                color: "white"
            }
            PropertyChanges {
                target: root
                color: "#00A6E2"
            }
        },
        State { //stato del pulsante disable
            name: "disable"
            PropertyChanges {
                target: txt
                color: "#00A6E2"
            }
            PropertyChanges {
                target: root
                color: "#151B2E"
            }
        }
    ]
}
