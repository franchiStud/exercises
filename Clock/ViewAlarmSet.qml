import QtQuick

Component {
    Item {
        id: alarm

        property bool everyDay: true

        visible: root.view==="Alarm"

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

            ClickableElement {
                id: mouseArea
                nextStackView: viewAlarmDateSet
                nextView: "Alarm set date"
                onClicked: alarm.everyDay=false;
            }
        }

        AlarmSetHour {
            id: alarmSetHour

            isActive: view==="Alarm"
        }

        SetButton {// set date
            buttonTxt: "SET ALARM"

            ClickableElement {
                id: mouseAreaS
                enabled: !(!alarm.everyDay&&!buttonDateSet)

                doPush: false

                onClicked: {
                    var appendDate=buttonDateValue

                    if(alarm.everyDay)
                        everyDayAlarms.append({
                            "date": appendDate,
                            "everyDay": true,
                            "isActive": true
                        })
                    else
                        dateAlarms.append({
                            "date": appendDate,
                            "everyDay": false,
                            "isActive": true,
                            })
                    isThereAlarm=true
                }
            }
        }
    }
}
