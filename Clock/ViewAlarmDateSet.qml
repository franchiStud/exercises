import QtQuick

Component {

    Item {
        id: alarmSetDateGeneral

        AlarmSetDate {
            id: alarmSetDate
        }

        SetButton {
            buttonTxt: "SET DATE"

            onClick: { buttonDateSet=true }
        }
    }
}
