import QtQuick

Component {

    Item {
        id: alarmSetDateGeneral

        AlarmSetDate {
            id: alarmSetDate
        }

        SetButton {
            buttonTxt: "SET DATE"

            ClickableElement {
                id: mouseAreaS
                doPush: false
                onClicked: buttonDateSet=true
            }
        }
    }

}
