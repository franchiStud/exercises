import QtQuick

Rectangle { //pulsanti
    id: button
    width: 190
    height: 64
    visible: true
    border.color: "#FCB647"
    border.width: 1
    radius: 32
    color: "transparent"
   Text {
        color: "#FCB647"
        id: txt
        anchors.centerIn: parent
        font.family: "Buenos Aires"
        font.pixelSize: 30
        font.letterSpacing: 1.8
    }
    states: [
        State { //stato del pulsante timer
            name: "stTimer"
            PropertyChanges {
                target: txt
                text: "TIMER"
            }
        },
        State { //stato del pulsante alarm
            name: "stAlarm"
            PropertyChanges {
                target: txt
                text: "ALARM"
            }
        }
    ] //nel main ci sono due istanze di Button, una per timer e una per alarm
}
