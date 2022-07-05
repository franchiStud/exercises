import QtQuick

Item {
    id: timerSet

    property var stackView

    Head {
        id: head

        txt: "Timer"
    }

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

        stackView: timerSet.stackView

        onClick: {
            isThereTimer = true

            timerTimeLeftHours=timerHours.value
            timerStartHours=timerHours.value

            timerTimeLeftMinutes=timerMinutes.value
            timerStartMinutes=timerMinutes.value

            timerTimeLeftSeconds=0
        }
    }
}
