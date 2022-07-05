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

        pushEnter: Transition {
                 PropertyAnimation {
                     property: "opacity"
                     from: 0
                     to:1
                     duration: 200
                 }
             }
        pushExit: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 1
                to:0
                duration: 200
            }
        }
        popEnter: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 0
                to:1
                duration: 200
            }
        }
        popExit: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 1
                to:0
                duration: 200
            }
        }
    }

    Component {
        id: ac;

        AnalogClock {
            currentDate: root.currentDate

            NextPageButton {
                stackView: stackViewClock
                nextStackView: dc
            }
        }
    }

    Component {
        id: dc;

        DigitalClock {
            currentDate: root.currentDate

            NextPageButton {
                stackView: stackViewClock
                doPush: false
            }
        }
    }

//    AnalogClock {// orologio analogico
//        id: ac

//        currentDate: root.currentDate

//        MouseArea {
//            anchors.fill: parent
//            onClicked: {
//                ac.visible=false
//                dc.visible=true
//            }
//        }
//    }

//    DigitalClock {// orologio digitale
//        id: dc

//        visible: false

//        currentDate: root.currentDate

//        MouseArea {
//            anchors.fill: parent
//            onClicked: {
//                dc.visible=false
//                ac.visible=true
//            }
//        }
//    }

    Timer { //l'ora si aggiorna ogni 0.5 secondi
        interval: 500; running: true; repeat: true
        onTriggered: { currentDate=new Date() }
    }
}
