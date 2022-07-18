import QtQuick

Item {
    id: timerCountDown

    property var stackView

    Head {
        id: head

        txt: "Timer"
    }

    TimerCD { id: timerCD }

    Image {
        property bool clicked

        source: controls.isTimerRunning
                ? (mouseAreaP.containsPress ? "/assets/btn-pause-hover"
                                            : "/assets/btn-pause-active")
                : (mouseAreaP.containsPress ? "/assets/btn-play-hover"
                                            : "/assets/btn-play-active")

        anchors.centerIn: parent
        anchors.verticalCenterOffset: 250
        anchors.horizontalCenterOffset: 100

        MouseArea {
            id: mouseAreaP

            anchors.fill: parent

            onClicked: {
                onClicked: controls.isTimerRunning=!controls.isTimerRunning
            }
        }
    }

    Image {
        source: mouseAreaR.containsPress
                ? "/assets/btn-reload-hover"
                : "/assets/btn-reload-active"

        anchors.centerIn: parent
        anchors.verticalCenterOffset: 250
        anchors.horizontalCenterOffset: -100

        MouseArea {
            id: mouseAreaR

            anchors.fill: parent

            onClicked: {
                controls.isTimerRunning=false
                timerValues.leftHours=timerValues.startHours
                timerValues.leftMinutes=timerValues.startMinutes
                timerValues.leftSeconds=0
                controls.isTimerRunning=true
            }
        }
    }

    TimerCircle {
        anchors.centerIn: parent
        anchors.verticalCenterOffset: -30

        timeLeft: (timerValues.leftHours*3600+timerValues.leftMinutes*60+timerValues.leftSeconds)
                  / (timerValues.startHours*3600+timerValues.startMinutes*60) }
}
