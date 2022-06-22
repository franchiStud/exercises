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
        visible: root.view!=="DeveClock" ? true : false
        state: "disabled"
        MouseArea{
            anchors.fill: parent
            onClicked: {
                var nextView = ""
                switch (view){
                    case "Timer": nextView="DeveClock"; break
                    case "Alarm": nextView="DeveClock"; break
                }
                parent.state= "enabled"
                deveClockTransition.thenDisable=parent
                deveClockTransition.nextView=nextView
                deveClockTransition.running=true
            }
        }
    }

    //-------------------------------- view DeveClock
    Clock{
        visible: root.view==="DeveClock" ? true : false
    }

    Button{ //pulsante timer
        id: timerButton
        x: 18
        state: "disabled"
        buttonTxt: "TIMER"
        visible: root.view==="DeveClock" ? true : false
        MouseArea{
            anchors.fill: parent
            onClicked: {
                parent.state= "enabled"
                deveClockTransition.thenDisable=parent
                deveClockTransition.nextView="Timer"
                deveClockTransition.running=true
            }
        }
    }
    Button{ //pulsante allarme
        id: alarmButton
        x: 272
        state: "disabled"
        buttonTxt: "ALARM"
        visible: root.view==="DeveClock" ? true : false
        MouseArea{
            anchors.fill: parent
            onClicked: {
                parent.state= "enabled"
                deveClockTransition.thenDisable=parent
                deveClockTransition.nextView="Alarm"
                deveClockTransition.running=true
            }
        }
    }

    Timer {
        id: deveClockTransition
        property string nextView
        property var thenDisable
        interval: 300; running: false; repeat: false
        onTriggered: {
            thenDisable.state="disabled"
            root.view=nextView
        }
    }

    Image {
        y: 33
        x: 403
        source: "/assets/alarm-on-feedback.svg"
        visible: root.view==="DeveClock" ? root.isThereAlarm : false
    }
    Image {
        y: 33
        x: 349
        source: "/assets/timer.svg"
        visible: root.view==="DeveClock" ? root.isThereTimer : false
    }

    //-------------------------------- view Alarm
    AlarmDateButton{
        visible: root.view==="Alarm" ? true : false
        state: "selected"
        buttonTxt: "Everyday"
        x: 34
    }
    AlarmDateButton{
        visible: root.view==="Alarm" ? true : false
        state: "disabled"
        buttonTxt: "Set date"
        x: 254
    }
}
