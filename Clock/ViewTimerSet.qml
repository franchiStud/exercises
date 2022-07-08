import QtQuick

Item {
    id: timerSet

    property var stackView

    signal clickTimer()

    Head {
        id: head

        txt: "Timer"
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

        onClick: timerSet.clickTimer()
    }
}
