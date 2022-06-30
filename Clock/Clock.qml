import QtQuick

Item {
    anchors.centerIn: parent

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
}
