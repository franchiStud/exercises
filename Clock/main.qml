import QtQuick
import QtMultimedia
import QtQuick.Controls

Window {
    id: root

    property bool isThereAlarm: false
    property bool isThereTimer: false
    property string view: "DeveClock"

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
                transitionTimer.doPush = false
            }
        }
    }

    Timer {
        id: transitionTimer

        property string nextView
        property var thenChange
        property string nextState
        property var nextStackView
        property bool doPush: true
        property bool changeStackView: true

        interval: 300; running: false; repeat: false
        onTriggered: {
            thenChange.state=nextState
            root.view=nextView

            if(changeStackView){
                if(doPush)
                    stackView.push(nextStackView)
                else {
                    stackView.pop()
                    doPush=true
                }
            } else
                changeStackView= true

        }
    }

    StackView {
        id: stackView

        anchors.fill: parent

        initialItem: viewDeveClock

        pushEnter: Transition {
                 PropertyAnimation {
                     property: "opacity"
                     from: 0
                     to:1
                     duration: 200
                 }
             }
             pushExit: Transition {
                 PropertyAnimation {
                     property: "opacity"
                     from: 1
                     to:0
                     duration: 200
                 }
             }
             popEnter: Transition {
                 PropertyAnimation {
                     property: "opacity"
                     from: 0
                     to:1
                     duration: 200
                 }
             }
             popExit: Transition {
                 PropertyAnimation {
                     property: "opacity"
                     from: 1
                     to:0
                     duration: 200
                 }
             }
    }

    ViewDeveClock    { id: viewDeveClock }
    ViewAlarmSet     { id: viewAlarmSet }
    ViewAlarmDateSet { id: viewAlarmDateSet }
    ViewAlarmList    { id: viewAlarmList }
    ViewTimerSet     { id: viewTimerSet }
    ViewTimerCD      { id: viewTimerCD }


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
                var alarmD = dateAlarm.get(e).date
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
