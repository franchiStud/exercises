import QtQuick

Item {
    id: root
    anchors.centerIn: parent

    property var currentDate: new Date()

    AnalogClock {// orologio analogico
        id: ac

        currentDate: root.currentDate

        MouseArea {
            anchors.fill: parent
            onClicked: {
                ac.visible=false
                dc.visible=true
            }
        }
    }

    DigitalClock {// orologio digitale
        id: dc

        visible: false

        currentDate: root.currentDate

        MouseArea {
            anchors.fill: parent
            onClicked: {
                dc.visible=false
                ac.visible=true
            }
        }
    }

    Timer { //l'ora si aggiorna ogni 0.5 secondi
        interval: 500; running: true; repeat: true
        onTriggered: { currentDate=new Date() }
    }
}
