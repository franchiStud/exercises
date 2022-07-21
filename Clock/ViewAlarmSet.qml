import QtQuick

Item {
    id: alarm

    property bool everyDay: true

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

        buttonTxt: alarms.dateSet
                    ? Qt.formatDateTime(alarms.date,"dd/MM/yyyy")
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
    }

    SetButton {// set date
        id: setAlarm

        buttonTxt: "SET ALARM"

        onClick: {
            if(!alarm.everyDay&&!alarms.dateSet) return

            if(alarm.everyDay)
                everyDayAlarms.append({
                    "date": alarms.assignDate(),
                    "everyDay": true,
                    "isActive": true
                })
            else
                dateAlarms.append({
                    "date": alarms.assignDate(),
                    "everyDay": false,
                    "isActive": true,
                    })
            alarms.newAlarm();

            alarms.dateSetTime(6,0)

            clickSet()
        }
    }
}
