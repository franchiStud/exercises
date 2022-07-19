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

        buttonTxt: alarmDateSet.hasDateBeenSet
                    ? Qt.formatDateTime(alarmDateSet.date,"dd/MM/yyyy")
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
            if(!alarm.everyDay&&!alarmDateSet.hasDateBeenSet) return

            if(alarm.everyDay)
                everyDayAlarms.append({
                    "date": alarmDateSet.date,
                    "everyDay": true,
                    "isActive": true
                })
            else
                dateAlarms.append({
                    "date": alarmDateSet.date,
                    "everyDay": false,
                    "isActive": true,
                    })
            controls.isThereAlarm=true

            alarmDateSet.assign(6,0)

            clickSet()
            controls.activeAlarms++;
        }
    }
}
