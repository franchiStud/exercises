import QtQuick

Rectangle { //pulsanti
   id: root
   property string buttonTxt
   y: 690
   width: 190
   height: 64
   visible: true
   border.color: "#FCB647"
   border.width: 1
   radius: 32
   color: "transparent"
   Behavior on color{
       ColorAnimation {duration: 250}
   }

   Text {
       id: txt
       color: "#FCB647"
       text: root.buttonTxt
       anchors.centerIn: parent
       font.family: "Buenos Aires"
       font.pixelSize: 30
       font.letterSpacing: 1.8
       Behavior on color{
           ColorAnimation {duration: 250}
       }
    }
    states: [
        State {
            name: "enabled"
            PropertyChanges {
                target: root
                color: "#FCB647"
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
                color: "#FCB647"
            }
        }
    ] //nel main ci sono due istanze di Button, una per timer e una per alarm
}
