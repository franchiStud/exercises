import QtQuick

Item {
    id: deveClock

    property var stackView

    Head {
        id: head

        txt: "DeveClock"
    }

    Clock {}

    Button {
        id: timerButton

        anchors.horizontalCenter: deveClock.horizontalCenter
        anchors.horizontalCenterOffset: -width/2-30

        buttonTxt: "TIMER"

        nextStackView: isThereTimer
                  ? viewTimerCD
                  : viewTimerSet
        stackView: deveClock.stackView
    }

    Button {
        id: alarmButton

        anchors.horizontalCenter: deveClock.horizontalCenter
        anchors.horizontalCenterOffset: width/2+30


        buttonTxt: "ALARM"

        nextStackView: viewAlarmSet
        stackView: deveClock.stackView
    }

    Image {
        source: "/assets/alarm-on-feedback.svg"

        anchors.centerIn: parent
        anchors.verticalCenterOffset: -340
        anchors.horizontalCenterOffset: 180

        visible: isThereAlarm

        ClickableElement {
            nextStackView: viewAlarmList
            stackView: deveClock.stackView
        }
    }

    Image {
        source: "/assets/timer.svg"

        anchors.centerIn: parent
        anchors.verticalCenterOffset: -340

        anchors.horizontalCenterOffset: 180 - (isThereAlarm ? 50 : 0)

        visible: isThereTimer

        ClickableElement {
            nextStackView: viewTimerCD
            stackView: deveClock.stackView
        }
    }
}
