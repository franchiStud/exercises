import QtQuick

Rectangle {
   id: root

   property string buttonTxt

   x: 23
   y: 706
   width: 434
   height: buttonHeight
   radius: 32

   visible: true

   border.color: "#00A6E2"
   border.width: 1

   Text {
       id: txt

       text: buttonTxt

       anchors.centerIn: parent

       color: "#00A6E2"
       font.family: "Buenos Aires"
       font.pixelSize: 36
       font.letterSpacing: 1.8

       Behavior on color{
           ColorAnimation{ duration: 250 }
       }
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

    Behavior on color{
        ColorAnimation{ duration: 250 }
    }
}
