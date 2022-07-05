import QtQuick

Item {
    id: alarmSetDateGeneral

    property var stackView

    Head {
        id: head

        txt: "Set date"
    }

    AlarmSetDate {
        id: alarmSetDate
    }

    SetButton {
        buttonTxt: "SET DATE"

        stackView: alarmSetDateGeneral.stackView
        onClick: { buttonDateSet=true }
    }
}
