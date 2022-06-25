import QtQuick

Window {
    id: root

    property bool isThereAlarm: false
    property bool isThereTimer: false
    property string view: "DeveClock"

    property int buttonY: 690
    property int buttonHeight: 64

    width: 480
    height: 800
    visible: true

    color: "#151B2E"
    title: "DeveClock"

    //-------------------------------- elementi comuni a più view
    Head {
        txt: root.view
    }

    Back { // presente in tutte le view tranne DeveClock
        visible: root.view!=="DeveClock"

        state: "disabled"

        MouseArea {
            anchors.fill: parent
            onClicked: {
                parent.state = "enabled"
                transitionTimer.thenChange = parent
                transitionTimer.nextState = "disabled"
                transitionTimer.nextView = (view==="Set date") ?
                                          "Alarm"
                                        : "DeveClock"
                transitionTimer.running = true
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
    Item {
        id: deveClock

        visible: root.view==="DeveClock"

        Clock {}

        Button { //pulsante timer
            id: timerButton

            buttonY: root.buttonY
            buttonHeight: root.buttonHeight

            x: 18

            buttonTxt: "TIMER"

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    parent.state = "enabled"
                    transitionTimer.thenChange = parent
                    transitionTimer.nextView = "Timer"
                    transitionTimer.nextState = "disabled"
                    transitionTimer.running = true
                }
            }
        }

        Button {
            id: alarmButton

            x: 272

            buttonY: root.buttonY
            buttonHeight: root.buttonHeight

            buttonTxt: "ALARM"

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    parent.state = "enabled"
                    transitionTimer.thenChange = parent
                    transitionTimer.nextView = "Alarm"
                    transitionTimer.nextState = "disabled"
                    transitionTimer.running = true
                }
            }
        }

        Image {
            source: "/assets/alarm-on-feedback.svg"

            y: 33
            x: 403

            visible: root.isThereAlarm

            MouseArea {
                anchors.fill: parent
                onClicked: { view="Alarm clock list" }
            }
        }

        Image {
            source: "/assets/timer.svg"

            y: 33
            x: 349

            visible: root.isThereTimer
        }
    }


    //----------------------------------- tutte le view relative ad Alarm
    Item {
        id: alarmGeneral
        //-------------------------------- view Alarm
        Item {
            id: alarm

            property bool everyDay: true
            property bool setDate: false

            visible: root.view==="Alarm"

            AlarmDateButton {
                id: alarmEveryday

                x: 34

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
                        alarmDate.state= !alarm.everyDay ?
                                    "disabled" : "selected"
                        alarm.everyDay= !alarm.everyDay
                    }
                }
            }

            AlarmDateButton {
                id: alarmDate

                x: 254

                state: "disabled"
                buttonTxt: "Set date"

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        parent.state="selected-hover"
                        transitionTimer.thenChange=parent
                        transitionTimer.nextView="Set date"
                        transitionTimer.nextState= "selected"
                        transitionTimer.running=true
                        alarmEveryday.state= "disabled"
                        alarm.everyDay= false
                    }
                }
            }

            AlarmSetHour {
                id: alarmSetHour

                isActive: root.view==="Alarm"
            }

            SetButton {// set date
                x: 23
                y: 706

                state: "disable"
                buttonTxt: "SET ALARM"

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if(!alarm.everyDay&&!alarm.setDate) return
                        if(alarm.everyDay)
                            alarmList.everyDayAlarms.append({
                                "hours": alarmSetHour.hourSet[0],
                                "minutes": alarmSetHour.hourSet[1],
                                "day": 0,
                                "month": 0,
                                "year": 0,
                                "isActive": true,
                                })
                        else
                            alarmList.dateAlarms.append({
                                "hours": alarmSetHour.hourSet[0],
                                "minutes": alarmSetHour.hourSet[1],
                                "day": alarmSetDate.newDate[0],
                                "month": alarmSetDate.newDate[1],
                                "year": alarmSetDate.newDate[2],
                                "isActive": true,
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
        Item {
            id: alarmClockList

            visible: root.view==="Alarm clock list"

            AlarmList {
                id: alarmList
            }

            DeleteButton {
                x: 23
                y: 706

                buttonY: root.buttonY
                buttonHeight: root.buttonHeight

                visible: alarmList.howManySelected>0
                state: "disabled"

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        for(var a=0;a<alarmList.isSelected.length;a++){
                            for(var e=0;e<alarmList.everyDayAlarms.count;e++)
                                if(alarmClockList.equals(alarmList.isSelected[a],
                                                         alarmList.everyDayAlarms.get(e)))
                                alarmList.everyDayAlarms.remove(e, 1)

                            for(var i=0;i<alarmList.dateAlarms.count;i++)
                                if(alarmClockList.equals(alarmList.isSelected[a],
                                                         alarmList.dateAlarms.get(i)))
                                alarmList.dateAlarms.remove(i, 1)

                        }
                        parent.state= "enabled"
                        transitionTimer.thenChange=parent
                        transitionTimer.nextView="Alarm clock list"
                        transitionTimer.nextState="disabled"
                        transitionTimer.running=true
                        deleteButtonTimer.running=true
                        root.isThereAlarm=alarmList.dateAlarms.count>0 ||
                                alarmList.everyDayAlarms.count>0
                    }
                }
                Timer {
                    id: deleteButtonTimer

                    interval: 300; running: false; repeat: false;
                    onTriggered: { alarmList.howManySelected=0 }
                }
            }

            function equals(isSelected, listedAlarm) {
                return listedAlarm.hours===
                        isSelected.hours &&
                    listedAlarm.minutes===
                        isSelected.minutes &&
                    listedAlarm.day===
                         isSelected.day &&
                    listedAlarm.month===
                         isSelected.month &&
                    listedAlarm.year===
                         isSelected.year
            }
        }

        Item {
            id: alarmSetDateGeneral

            visible: view==="Set date"

            AlarmSetDate {
                id: alarmSetDate
            }

            SetButton {
                state: "disable"
                buttonTxt: "SET DATE"

                MouseArea {
                    anchors.fill: parent
                    onClicked:{
                        alarmDate.buttonTxt=
                                          alarmSetDate.newDate[0]+"/"+
                                          alarmSetDate.newDate[1]+"/"+
                                          alarmSetDate.newDate[2]
                        alarm.setDate=true
                        parent.state= "active"
                        transitionTimer.thenChange=parent
                        transitionTimer.nextView="Alarm"
                        transitionTimer.nextState="disable"
                        transitionTimer.running=true
                    }
                }
            }
        }
    }
}
