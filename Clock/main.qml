import QtQuick
import QtMultimedia
import QtQuick.Controls

Window {
    id: root

    property bool isThereAlarm: false
    property bool isThereTimer: false

    property int buttonY: root.height/2*0.725
    property int buttonHeight: root.height*0.08

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
        visible: stackViewMain.depth>1

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
        ViewDeveClock { stackView: stackViewMain }
    }
    Component {
        id: viewAlarmSet
        ViewAlarmSet { stackView: stackViewMain }
    }
    Component {
        id: viewAlarmDateSet
        ViewAlarmDateSet { stackView: stackViewMain }
    }
    Component {
        id: viewAlarmList
        ViewAlarmList { stackView: stackViewMain }
    }
    Component {
        id: viewTimerSet
        ViewTimerSet { stackView: stackViewMain }
    }
    Component {
        id: viewTimerCD
        ViewTimerCD { stackView: stackViewMain }
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
        interval: 1000; running: isThereTimer && isTimerRunning; repeat: true
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
