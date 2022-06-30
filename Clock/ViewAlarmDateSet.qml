import QtQuick

Component {

    Item {
        id: alarmSetDateGeneral

        AlarmSetDate {
            id: alarmSetDate
        }

        SetButton {
            buttonTxt: "SET DATE"

            MouseArea {
                anchors.fill: parent
                onClicked:{
                    buttonDateSet=true
                    parent.state= "active"
                    transitionTimer.thenChange=parent
                    transitionTimer.nextView="Alarm"
                    transitionTimer.nextState="disable"
                    transitionTimer.running=true
                    transitionTimer.doPush=false
                }
            }
        }
    }

}
