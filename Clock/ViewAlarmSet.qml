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

            state: "selected"
            buttonTxt: "Everyday"

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    parent.state= !alarm.everyDay ?
                                "selected-hover" : "disabled-hover"

                    transitionTimer.thenChange=parent
                    transitionTimer.nextView="Alarm"
                    transitionTimer.nextState= !alarm.everyDay ?
                                "selected" : "disabled"
                    transitionTimer.running=true
                    transitionTimer.changeStackView=false

                    alarmDate.state= alarm.everyDay ?
                                "selected" : "disabled"
                    alarm.everyDay= !alarm.everyDay
                }
            }
        }

        AlarmDateButton {
            id: alarmDate

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.horizontalCenterOffset: width/2+10

            state: "disabled"
            buttonTxt: buttonDateSet
                        ? buttonDateValue.getDate()+"/"+
                         (buttonDateValue.getMonth()+1)+"/"+
                          buttonDateValue.getFullYear()
                         : "Set date"


            MouseArea {
                anchors.fill: parent
                onClicked: {
                    parent.state="selected-hover"

                    transitionTimer.thenChange=parent
                    transitionTimer.nextView="Set date"
                    transitionTimer.nextState= "selected"
                    transitionTimer.running=true
                    transitionTimer.nextStackView = viewAlarmDateSet

                    alarmEveryday.state= "disabled"
                    alarm.everyDay= false

                }
            }
        }

        AlarmSetHour {
            id: alarmSetHour

            isActive: view==="Alarm"
        }

        SetButton {// set date
            buttonTxt: "SET ALARM"

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if(!alarm.everyDay&&!buttonDateSet) return

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

                    parent.state= "active"
                    transitionTimer.thenChange=parent
                    transitionTimer.nextView="DeveClock"
                    transitionTimer.nextState="disable"
                    transitionTimer.running=true
                    isThereAlarm=true
                    transitionTimer.doPush= false
                }
            }
        }
    }
}
