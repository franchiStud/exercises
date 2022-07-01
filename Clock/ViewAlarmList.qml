import QtQuick
import QtMultimedia

Component {

    Item {
        id: alarmClockList

        AlarmList {
            id: alarmListObj
        }

        DeleteButton {
            visible: alarmListObj.howManySelected>0
            state: "disabled"

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    for(var a=0;a<alarmListObj.isSelected.length;a++){
                        for(var e=0;e<everyDayAlarms.count;e++)
                            if(alarmClockList.equals(alarmListObj.isSelected[a],
                                        everyDayAlarms.get(e)))
                           {
                                everyDayAlarms.remove(e--, 1)
                            }



                        for(var i=0;i<dateAlarms.count;i++)
                            if(alarmClockList.equals(alarmListObj.isSelected[a],
                                        dateAlarms.get(i)))
                            {
                                dateAlarms.remove(i--, 1)
                            }
                    }
                    parent.state= "enabled"
                    transitionTimer.thenChange=parent
                    transitionTimer.nextView="Alarm clock list"
                    transitionTimer.nextState="disabled"
                    transitionTimer.running=true
                    deleteButtonTimer.running=true
                    root.isThereAlarm=dateAlarms.count>0 ||
                                      everyDayAlarms.count>0
                    transitionTimer.changeStackView = false
                }
            }
            Timer {
                id: deleteButtonTimer

                interval: 300; running: false; repeat: false;
                onTriggered: { alarmListObj.howManySelected=0 }
            }
        }
    }
}
