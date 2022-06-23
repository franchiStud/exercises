import QtQuick

Window {
    id: root
    property bool isThereAlarm: false
    property bool isThereTimer: false
    property string view: "DeveClock"
    width: 480
    height: 800
    visible: true
    color: "#151B2E"
    title: qsTr("DeveClock")

    //-------------------------------- elementi comuni a più view
    Head{
        txt: root.view
    }

    Back{ // presente in tutte le view tranne DeveClock
        visible: root.view!=="DeveClock"
        state: "disabled"
        MouseArea{
            anchors.fill: parent
            onClicked: {
                parent.state= "enabled"
                transitionTimer.thenChange=parent
                transitionTimer.nextState="disabled"
                transitionTimer.nextView= view==="Set date" ? "Alarm" : "DeveClock"
                transitionTimer.running=true
            }
        }
        Timer {
            id: transitionTimer
            property string nextView
            property var thenChange
            property string nextState
            interval: 300; running: false; repeat: false
            onTriggered: {
                thenChange.state=nextState
                root.view=nextView
            }
        }
    }

    //-------------------------------- view DeveClock
    Item{
        id: deveClock
        visible: root.view==="DeveClock"

        Clock{}

        Button{ //pulsante timer
            id: timerButton
            x: 18
            state: "disabled"
            buttonTxt: "TIMER"
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    parent.state= "enabled"
                    transitionTimer.thenChange=parent
                    transitionTimer.nextView="Timer"
                    transitionTimer.nextState="disable"
                    transitionTimer.running=true
                }
            }
        }

        Button{ //pulsante allarme
            id: alarmButton
            x: 272
            state: "disabled"
            buttonTxt: "ALARM"
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    parent.state= "enabled"
                    transitionTimer.thenChange=parent
                    transitionTimer.nextView="Alarm"
                    transitionTimer.nextState="disable"
                    transitionTimer.running=true
                }
            }
        }

        Image {
            y: 33
            x: 403
            source: "/assets/alarm-on-feedback.svg"
            visible: root.isThereAlarm
        }

        Image {
            y: 33
            x: 349
            source: "/assets/timer.svg"
            visible: root.isThereTimer
        }
    }


    //----------------------------------- tutte le view relative ad Alarm
    Item{
        id: alarmGeneral
        property var newDate: [0,0,0]
        //-------------------------------- view Alarm
        Item{
            visible: root.view==="Alarm"
            id: alarm
            property bool everyDay: true
            property bool setDate: false
            AlarmDateButton{
                id: alarmEveryday
                state: "selected"
                buttonTxt: "Everyday"
                x: 34
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        parent.state= !alarm.everyDay ?
                                    "selected-hover" : "disabled-hover"
                        transitionTimer.thenChange=parent
                        transitionTimer.nextView="Alarm"
                        transitionTimer.nextState= !alarm.everyDay ?
                                    "selected" : "disabled"
                        transitionTimer.running=true
                        alarmDay.state= !alarm.everyDay ?
                                    "disabled" : "selected"
                        alarm.everyDay= !alarm.everyDay
                    }
                }
            }

            AlarmDateButton{
                id: alarmDay
                state: "disabled"
                buttonTxt: "Set date"
                x: 254
            }

            AlarmHourSet{
                id: alarmHourSet
                isActive: root.view==="Alarm"
            }

            SetButton{
                x: 23
                y: 706
                state: "disable"
                buttonTxt: "SET ALARM"
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        if(!alarm.everyDay&&!alarm.setDate)return
                        alarmList.alarms.append({
                            "everyDay": alarm.everyDay,
                            "hours": alarmHourSet.hourSet[0],
                            "minutes": alarmHourSet.hourSet[1],
                            "day": alarmGeneral.newDate[0],
                            "month": alarmGeneral.newDate[1],
                            "year": alarmGeneral.newDate[2],
                            "on": true
                            })
                        parent.state= "active"
                        transitionTimer.thenChange=parent
                        transitionTimer.nextView="DeveClock"
                        transitionTimer.nextState="disable"
                        transitionTimer.running=true
                        isThereAlarm=true
                    }
                }
            }
        }


        //-------------------------------- view Alarm clock list
        Item{
            id: alarmClockList
            visible: root.view==="Alarm clock list"
        }

        AlarmList{
            id: alarmList
        }
    }

}
