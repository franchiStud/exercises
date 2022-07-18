import QtQuick

Item {
    id: timerSet

    property var stackView
    property real timerHoursValue: timerHours.value
    property real timerMinutesValue: timerMinutes.value

    signal click()

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

        onClick: {
            controls.isThereTimer=true;


            timerValues.leftHours=timerHoursValue
            timerValues.startHours=timerHoursValue

            timerValues.leftMinutes=timerMinutesValue
            timerValues.startMinutes=timerMinutesValue

            timerValues.leftSeconds=0

            timerSet.click()
        }
    }
}
