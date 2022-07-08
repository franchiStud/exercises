import QtQuick
import QtQuick.Controls 2.0

Item {
    id: root

    anchors.fill: parent

    property var currentDate: new Date()

    StackView {
        id: stackViewClock

        initialItem: ac

        anchors.centerIn: parent
        width: 444
        height: 390
    }

    Component {
        id: ac;

        AnalogClock {
            currentDate: root.currentDate

            MouseArea {
                anchors.fill: parent

                onClicked: stackViewClock.push(dc)
            }
        }
    }

    Component {
        id: dc;

        DigitalClock {
            currentDate: root.currentDate

            MouseArea {
                anchors.fill: parent

                onClicked: stackViewClock.pop()
            }
        }
    }

    Timer { //l'ora si aggiorna ogni 0.5 secondi
        interval: 500; running: true; repeat: true
        onTriggered: { currentDate=new Date() }
    }
}
