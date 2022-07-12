import QtQuick

Item {
    id: alarmSetDateGeneral

    signal click

    Head {
        id: head

        txt: "Set date"
    }

    AlarmSetDate { id: alarmSetDate }

    SetButton {
        buttonTxt: "SET DATE"

        onClick: alarmSetDateGeneral.click()
    }
}
