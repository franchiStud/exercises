import QtQuick

Component {
    Item {
        id: timerSet

        TimerSet {
            id: timerHours

            anchors.horizontalCenterOffset: -width/2-20

            txt: "hours"
        }

        TimerSet {
            id: timerMinutes

            anchors.horizontalCenterOffset: width/2+20

            txt: "mins"
        }

        Text {
            text: ":"

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: timerHours.verticalCenter
            anchors.verticalCenterOffset: timerHours.verticalOffset

            font.pixelSize: 120
            color: "#707070"
        }

        SetButton {
            buttonTxt: "SET TIMER"

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    parent.state="enabled"

                    transitionTimer.thenChange=parent
                    transitionTimer.nextState="disable"
                    transitionTimer.nextView="DeveClock"
                    transitionTimer.running=true
                    transitionTimer.doPush = false
                    isThereTimer = true

                    setTimerTimer.running=true
                }
            }
        }

        Timer {
            id: setTimerTimer

            interval: 300; running: false; repeat: false;
            onTriggered: {
                timerTimeLeftHours=timerHours.value
                timerStartHours=timerHours.value

                timerTimeLeftMinutes=timerMinutes.value
                timerStartMinutes=timerMinutes.value

                timerTimeLeftSeconds=0
            }
        }
    }
}
