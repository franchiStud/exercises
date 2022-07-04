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

            nextStackView: isThereTimer
                      ? viewTimerCD
                      : viewTimerSet
            nextView: "Timer"
        }

        Button {
            id: alarmButton

            anchors.horizontalCenter: deveClock.horizontalCenter
            anchors.horizontalCenterOffset: width/2+30


            buttonTxt: "ALARM"

            nextStackView: viewAlarmSet
            nextView: "Alarm"
        }

        Image {
            source: "/assets/alarm-on-feedback.svg"

            anchors.centerIn: parent
            anchors.verticalCenterOffset: -340
            anchors.horizontalCenterOffset: 180

            visible: isThereAlarm

            ClickableElement {
                nextView: "Alarm clock list"
                nextStackView: viewAlarmList
            }
        }

        Image {
            source: "/assets/timer.svg"

            anchors.centerIn: parent
            anchors.verticalCenterOffset: -340

            anchors.horizontalCenterOffset: 180 - (isThereAlarm ? 50 : 0)

            visible: isThereTimer

            ClickableElement {
                nextView: "Timer"
                nextStackView: viewTimerCD
            }
        }
    }

}
