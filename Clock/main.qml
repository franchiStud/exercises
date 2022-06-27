import QtQuick

Window {
    id: root

    property bool isThereAlarm: false
    property bool isThereTimer: false
    property string view: "DeveClock"

    property int buttonY: root.height/2*0.725
    property int buttonHeight: root.height*0.08

    width: 480
    height: 800
    visible: true

    color: "#151B2E"
    title: "DeveClock"

    //-------------------------------- elementi comuni a più view
    Head {
        id: head

        txt: root.view
    }

    Back { // presente in tutte le view tranne DeveClock
        visible: root.view!=="DeveClock"

        anchors.verticalCenter: head.verticalCenter

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

        anchors.centerIn: parent

        visible: root.view==="DeveClock"

        Clock {}

        Button { //pulsante timer
            id: timerButton

            anchors.horizontalCenter: deveClock.horizontalCenter
            anchors.horizontalCenterOffset: -width/2-30

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

            anchors.horizontalCenter: deveClock.horizontalCenter
            anchors.horizontalCenterOffset: width/2+30


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

            anchors.centerIn: parent
            anchors.verticalCenterOffset: -340
            anchors.horizontalCenterOffset: 180

            visible: root.isThereAlarm

            MouseArea {
                anchors.fill: parent
                onClicked: { view="Alarm clock list" }
            }
        }

        Image {
            source: "/assets/timer.svg"

            anchors.centerIn: parent
            anchors.verticalCenterOffset: -340

            anchors.horizontalCenterOffset: 180 - (isThereAlarm ? 50 : 0)

            visible: root.isThereTimer
        }
    }


    //----------------------------------- tutte le view relative ad Alarm
    Item {
        id: alarmGeneral

        anchors.centerIn: parent

        //-------------------------------- view Alarm
        Item {
            id: alarm

            property bool everyDay: true
            property bool setDate: false

            anchors.centerIn: parent

            visible: root.view==="Alarm"

            AlarmDateButton {
                id: alarmEveryday

                anchors.horizontalCenter: alarm.horizontalCenter
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
                        alarmDate.state= !alarm.everyDay ?
                                    "disabled" : "selected"
                        alarm.everyDay= !alarm.everyDay
                    }
                }
            }

            AlarmDateButton {
                id: alarmDate

                anchors.horizontalCenter: alarm.horizontalCenter
                anchors.horizontalCenterOffset: width/2+10

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

                state: "disable"
                buttonTxt: "SET ALARM"

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if(!alarm.everyDay&&!alarm.setDate) return

                        var appendDate=alarmSetHour.hourSet

                        if(alarm.everyDay)
                            alarmList.everyDayAlarms.append({
                                "date": appendDate,
                                "everyDay": true,
                                "isActive": true
                            })
                        else{
                            appendDate.setDate(
                                alarmSetDate.newDate.getDate())
                            appendDate.setMonth(
                                        alarmSetDate.newDate.getMonth())
                            appendDate.setFullYear(
                                        alarmSetDate.newDate.getFullYear())
                            alarmList.dateAlarms.append({
                                "date": appendDate,
                                "everyDay": false,
                                "isActive": true,
                                })
                        }

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

            anchors.centerIn: parent

            visible: root.view==="Alarm clock list"

            AlarmList {
                id: alarmList
            }

            DeleteButton {
                visible: alarmList.howManySelected>0
                state: "disabled"

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        for(var a=0;a<alarmList.isSelected.length;a++){
                            for(var e=0;e<alarmList.everyDayAlarms.count;e++)
                                if(alarmClockList.equals(alarmList.isSelected[a],
                                            alarmList.everyDayAlarms.get(e)))
                               {
                                    alarmList.everyDayAlarms.remove(e, 1)
                                }



                            for(var i=0;i<alarmList.dateAlarms.count;i++)
                                if(alarmClockList.equals(alarmList.isSelected[a],
                                            alarmList.dateAlarms.get(i)))
                                {
                                    alarmList.dateAlarms.remove(i, 1)
                                }
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
                if(isSelected.everyDay!==listedAlarm.everyDay)
                    return false

                if(listedAlarm.everyDay)
                    return listedAlarm.date.getHours() ===
                            isSelected.date.getHours() &&
                           listedAlarm.date.getMinutes() ===
                            isSelected.date.getMinutes() &&
                           listedAlarm.date.getDate() ===
                            isSelected.date.getDate() &&
                           listedAlarm.date.getMonth() ===
                            isSelected.date.getMonth() &&
                           listedAlarm.date.getFullYear() ===
                            isSelected.date.getFullYear()
                else
                    return listedAlarm.date.getHours() ===
                            isSelected.date.getHours() &&
                           listedAlarm.date.getMinutes() ===
                            isSelected.date.getMinutes()
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
                                          alarmSetDate.newDate.getDate()+"/"+
                                          alarmSetDate.newDate.getMonth()+"/"+
                                          alarmSetDate.newDate.getFullYear()
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
