import QtQuick
import QtMultimedia
import QtQuick.Controls

Window {
    id: window

    property int buttonY: window.height/2*0.725
    property int buttonHeight: window.height*0.08

    property var everyDayAlarms: ListModel {}
    property var dateAlarms: ListModel {}

    width: 480
    height: 800
    visible: true

    color: "#151B2E"
    title: "DeveClock"

    Back { // presente in tutte le view tranne DeveClock
        opacity: stackViewMain.depth>1 ? 1 : 0

        anchors.verticalCenter: stackViewMain.top
        anchors.verticalCenterOffset: height*0.75

        onClick: stackViewMain.pop()
    }

    StackView {
        id: stackViewMain

        anchors.fill: parent

        initialItem: viewDeveClock
    }

    Component {
        id: viewDeveClock

        ViewDeveClock {

            onClickAlarm: stackViewMain.push(viewAlarmSet)

            onClickTimer: stackViewMain.push(timerValues.isThereTimer
                                             ? viewTimerCD
                                             : viewTimerSet)

            onClickAlarmList: stackViewMain.push(viewAlarmList)
        }
    }

    Component {
        id: viewAlarmSet
        ViewAlarmSet {
            onClickSet: stackViewMain.pop()
            onClickDateSet: stackViewMain.push(viewAlarmDateSet)
        }
    }

    Component {
        id: viewAlarmDateSet
        ViewAlarmDateSet {
            onClick: {
                stackViewMain.pop()
            }
        }
    }

    Component {
        id: viewAlarmList

        ViewAlarmList {

            AlarmList { id: alarmList }

            DeleteButton {
                visible: alarmList.howManySelected>0

                onClick: {
                    var alarmsToDelete=alarmList.isSelected.length;

                    for(var a=0;a<alarmList.isSelected.length;a++){
                        for(var e=0;e<everyDayAlarms.count;e++){

                            if(alarms.check(everyDayAlarms.get(e).date,
                                            alarmList.isSelected[a].date, true)
                             &&alarmList.isSelected[a].everyDay){

                                everyDayAlarms.remove(e--, 1);
                                alarms.activeAlarms--;

                                if(--alarmsToDelete==0)
                                    break;
                            }
                        }

                        for(var i=0;i<dateAlarms.count;i++){

                            if(alarms.check(dateAlarms.get(i).date,
                                            alarmList.isSelected[a].date, false)
                             &&!alarmList.isSelected[a].everyDay){

                                dateAlarms.remove(i--, 1)
                                alarms.activeAlarms--;

                                if(--alarmsToDelete==0)
                                    break;
                            }
                        }
                    }

                    alarms.isThereAlarm=dateAlarms.count>0 ||
                                      everyDayAlarms.count>0

                    alarmList.howManySelected=0
                }
            }

            NoAlarmSign { visible: dateAlarms.count+everyDayAlarms.count==0 }
        }
    }

    Component {
        id: viewTimerSet

        ViewTimerSet {
            onClick: {
                stackViewMain.pop()
            }
        }
    }

    Component {
        id: viewTimerCD

        ViewTimerCD {}
    }

    Timer {
        id: alarmTimer

        interval: 60000; running: alarms.isThereAlarm && alarms.activeAlarms>0
                         repeat:  alarms.isThereAlarm && alarms.activeAlarms>0
        onTriggered: {
            for(var e=0;e<everyDayAlarms.count;e++)
                if(alarms.check(everyDayAlarms.get(e).date,
                                currentDate.date, true))
                    alarms.playSound()

            for(var i=0;i<dateAlarms.count;i++)
                if(alarms.check(dateAlarms.get(i).date,
                                currentDate.date, false))
                    alarms.playSound()
        }
    }
}
