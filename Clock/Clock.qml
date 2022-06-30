import QtQuick
import QtQuick.Controls

Item {
    anchors.centerIn: parent

    property var currentDate: new Date()

    AnalogClock {// orologio analogico
        id: ac

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
