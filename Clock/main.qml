import QtQuick
import QtMultimedia
import QtQuick.Controls

Window {
    id: window

    property bool isThereAlarm: false
    property bool isThereTimer: false

    property int buttonY: window.height/2*0.725
    property int buttonHeight: window.height*0.08

    property var everyDayAlarms: ListModel {}
    property var dateAlarms: ListModel {}

    property bool buttonDateSet: false
    property var buttonDateValue: {
                                    var d=new Date()
                                    d.setMinutes(0)
                                    d.setHours(6)
                                    return d
                                 }

    property int timerTimeLeftHours: 0
    property int timerTimeLeftMinutes: 0
    property int timerTimeLeftSeconds: 0

    property int timerStartHours: 0
    property int timerStartMinutes: 0

    property bool isTimerRunning: true

    width: 480
    height: 800
    visible: true

    color: "#151B2E"
    title: "DeveClock"

    Back { // presente in tutte le view tranne DeveClock
        opacity: stackViewMain.depth>1 ? 1 : 0

        anchors.verticalCenter: stackViewMain.top
        anchors.verticalCenterOffset: height*0.75

        stackView: stackViewMain
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

            onClickTimer: stackViewMain.push(isThereTimer
                                             ? viewTimerCD
                                             : viewTimerSet)
            Image {
                source: "/assets/alarm-on-feedback.svg"

                anchors.centerIn: parent
                anchors.verticalCenterOffset: -340
                anchors.horizontalCenterOffset: 180

                visible: isThereAlarm

                MouseArea {
                    anchors.fill: parent
                    onClicked: stackViewMain.push(viewAlarmList)
                }
            }

            Image {
                source: "/assets/timer.svg"

                anchors.centerIn: parent
                anchors.verticalCenterOffset: -340

                anchors.horizontalCenterOffset: 180 - (isThereAlarm
                                                       ? 50
                                                       : 0)

                visible: isThereTimer

                MouseArea {
                    anchors.fill: parent
                    onClicked: stackViewMain.push(viewTimerCD)
                }
            }
        }
    }
    Component {
        id: viewAlarmSet
        ViewAlarmSet {
            buttonDateValue: window.buttonDateValue

            onClickSet: stackViewMain.pop()

            onClickDateSet: stackViewMain.push(viewAlarmDateSet)
        }
    }
    Component {
        id: viewAlarmDateSet
        ViewAlarmDateSet {
            onClick: {
                buttonDateSet=true
                stackViewMain.pop()
            }
        }
    }
    Component {
        id: viewAlarmList

        ViewAlarmList {

            onClickDelete: {
                for(var a=0;a<alarmListObj.isSelected.length;a++){
                    var now=alarmListObj.isSelected[a].date;

                    for(var e=0;e<everyDayAlarms.count;e++){
                        var alarmE = everyDayAlarms.get(e).date
                        if(now.getMinutes()===alarmE.getMinutes()
                         &&now.getHours()  ===alarmE.getHours()
                         &&alarmListObj.isSelected[a].everyDay)
                            everyDayAlarms.remove(e--, 1);
                    }


                    for(var i=0;i<dateAlarms.count;i++){
                        var alarmD = dateAlarms.get(i).date
                        if(now.getMinutes() ===alarmD.getMinutes()
                         &&now.getHours()   ===alarmD.getHours()
                         &&now.getDate()    ===alarmD.getDate()
                         &&now.getMonth()   ===alarmD.getMonth()
                         &&now.getFullYear()===alarmD.getFullYear()
                         &&!alarmListObj.isSelected[a].everyDay)
                            dateAlarms.remove(i--, 1)
                    }
                }

                isThereAlarm=dateAlarms.count>0 ||
                                  everyDayAlarms.count>0

                alarmListObj.howManySelected=0
            }

            AlarmList {
                id: alarmListObj
            }
        }
    }
    Component {
        id: viewTimerSet

        ViewTimerSet {

            onClickTimer: {
                stackViewMain.pop()

                isThereTimer = true

                timerTimeLeftHours=timerHours.value
                timerStartHours=timerHours.value

                timerTimeLeftMinutes=timerMinutes.value
                timerStartMinutes=timerMinutes.value

                timerTimeLeftSeconds=0
            }

            TimerSet {
                id: timerHours

                anchors.horizontalCenterOffset: -width/2-20

                txt: "hours"
            }

            TimerSet {
                id: timerMinutes

                anchors.horizontalCenterOffset: width/2+20

                txt: "mins"
            }
        }
    }
    Component {
        id: viewTimerCD

        ViewTimerCD {
            onClickPause: isTimerRunning= !isTimerRunning

            onClickReset: {
                timerTimeLeftHours=timerStartHours
                timerTimeLeftMinutes=timerStartMinutes
                timerTimeLeftSeconds=0
            }
        }
    }

    Timer {
        id: alarmTimer

        interval: 60000; running: true; repeat: true
        onTriggered: {
            var now = new Date()


            for(var e=0;e<everyDayAlarms.count;e++){
                var alarmE = everyDayAlarms.get(e).date
                if(now.getMinutes()===alarmE.getMinutes()
                 &&now.getHours()  ===alarmE.getHours())
                    alarmSound.play()
            }


            for(var i=0;i<dateAlarms.count;i++){
                var alarmD = dateAlarms.get(i).date
                if(now.getMinutes() ===alarmD.getMinutes()
                 &&now.getHours()   ===alarmD.getHours()
                 &&now.getDate()    ===alarmD.getDate()
                 &&now.getMonth()   ===alarmD.getMonth()
                 &&now.getFullYear()===alarmD.getFullYear())
                    alarmSound.play()
            }
        }
    }

    Timer {
        interval: 1000; running: isThereTimer && isTimerRunning;repeat: true
        onTriggered: {
            if(timerTimeLeftSeconds <1){

                if(timerTimeLeftMinutes < 1)

                    if(timerTimeLeftHours < 1){
                        isThereTimer=false
                        timerSound.play()
                    } else {
                        timerTimeLeftHours--
                        timerTimeLeftMinutes=59
                        timerTimeLeftSeconds=59
                    }
                else {
                    timerTimeLeftMinutes--
                    timerTimeLeftSeconds=59
                }

            } else
                timerTimeLeftSeconds--
        }
    }

    SoundEffect {
        id: alarmSound
        source: "/sounds/alarm.wav"
    }

    SoundEffect {
        id: timerSound
        source: "/sounds/timer.wav"
   }
}
