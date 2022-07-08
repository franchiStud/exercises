import QtQuick

Item {
    id: alarm

    property bool everyDay: true
    property var buttonDateValue

    signal clickSet()
    signal clickDateSet()

    Head {
        id: head

        txt: "Alarm"
    }

    AlarmDateButton {
        id: alarmEveryday

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: -width/2-10

        state: alarm.everyDay
                ? "selected"
                : "disabled"

        buttonTxt: "Everyday"
        MouseArea{
            anchors.fill: parent
            onClicked: alarm.everyDay=true
        }
    }

    AlarmDateButton {
        id: alarmDate

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: width/2+10

        state: alarm.everyDay
                ? "disabled"
                : "selected"

        buttonTxt: buttonDateSet
                    ? buttonDateValue.getDate()+"/"+
                     (buttonDateValue.getMonth()+1)+"/"+
                      buttonDateValue.getFullYear()
                     : "Set date"

        MouseArea {
            anchors.fill: parent

            onClicked:  {
                alarm.everyDay=false

                alarm.clickDateSet()
            }
        }
    }

    AlarmSetHour {
        id: alarmSetHour

        buttonDateValue: alarm.buttonDateValue
        onButtonDateValueChanged: alarm.buttonDateValue=buttonDateValue
    }

    SetButton {// set date
        id: setAlarm

        buttonTxt: "SET ALARM"

        onClick: {
            if(!alarm.everyDay&&!buttonDateSet) return

            if(alarm.everyDay)
                everyDayAlarms.append({
                    "date": buttonDateValue,
                    "everyDay": true,
                    "isActive": true
                })
            else
                dateAlarms.append({
                    "date": buttonDateValue,
                    "everyDay": false,
                    "isActive": true,
                    })
            isThereAlarm=true

            buttonDateValue.setHours(6)
            buttonDateValue.setMinutes(0)

            clickSet()
        }
    }
}
