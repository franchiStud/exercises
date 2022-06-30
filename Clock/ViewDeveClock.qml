import QtQuick

Component {
    Item {
        //anchors.centerIn: parent

        id: deveClock

        Clock {}

        Button {
            id: timerButton

            anchors.horizontalCenter: deveClock.horizontalCenter
            anchors.horizontalCenterOffset: -width/2-30

            buttonTxt: "TIMER"

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    parent.state = "enabled"
                    transitionTimer.thenChange = parent
                    transitionTimer.nextView = "Timer"
                    transitionTimer.nextState = "disabled"
                    transitionTimer.running = true
                    transitionTimer.nextStackView = isThereTimer
                                                      ? viewTimerCD
                                                      : viewTimerSet
                }
            }
        }

        Button {
            id: alarmButton

            anchors.horizontalCenter: deveClock.horizontalCenter
            anchors.horizontalCenterOffset: width/2+30


            buttonTxt: "ALARM"

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    parent.state = "enabled"
                    transitionTimer.thenChange = parent
                    transitionTimer.nextView = "Alarm"
                    transitionTimer.nextState = "disabled"
                    transitionTimer.running = true
                    transitionTimer.nextStackView= viewAlarmSet
                }
            }
        }

        Image {
            source: "/assets/alarm-on-feedback.svg"

            anchors.centerIn: parent
            anchors.verticalCenterOffset: -340
            anchors.horizontalCenterOffset: 180

            visible: isThereAlarm

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    view="Alarm clock list"
                    stackView.push(viewAlarmList)
                }
            }
        }

        Image {
            source: "/assets/timer.svg"

            anchors.centerIn: parent
            anchors.verticalCenterOffset: -340

            anchors.horizontalCenterOffset: 180 - (isThereAlarm ? 50 : 0)

            visible: isThereTimer

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    view="Timer"
                    stackView.push(viewTimerCD)
                }
            }
        }
    }

}
