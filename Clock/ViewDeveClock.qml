import QtQuick

Item {
    id: deveClock

    signal clickTimer()
    signal clickAlarm()
    signal clickAlarmList()

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

        onClick: deveClock.clickTimer()
    }

    Button {
        id: alarmButton

        anchors.horizontalCenter: deveClock.horizontalCenter
        anchors.horizontalCenterOffset: width/2+30

        buttonTxt: "ALARM"

        onClick: deveClock.clickAlarm()
    }

    Image {
        source: controls.activeAlarms>0
                ? "/assets/alarm-on-feedback.svg"
                : "/assets/alarm-off-feedback.svg"

        anchors.centerIn: parent
        anchors.verticalCenterOffset: -340
        anchors.horizontalCenterOffset: 180

        visible: controls.isThereAlarm

        MouseArea {
            anchors.fill: parent
            onClicked: deveClock.clickAlarmList()
        }
    }
    Image {
        source: "/assets/timer.svg"

        anchors.centerIn: parent
        anchors.verticalCenterOffset: -340

        anchors.horizontalCenterOffset: 180 - (controls.isThereAlarm
                                               ? 50
                                               : 0)
        visible: controls.isThereTimer

        MouseArea {
            anchors.fill: parent
            onClicked: deveClock.clickTimer()
        }
    }
}
