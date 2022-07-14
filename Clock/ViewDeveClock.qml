import QtQuick

Item {
    id: deveClock

    signal clickTimer()
    signal clickAlarm()

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
}
