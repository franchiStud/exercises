import QtQuick

Item {
    id: timerCountDown

    property var stackView

    Head {
        id: head

        txt: "Timer"
    }

    TimerCD {
        id: timerCD
    }

    Image {
        property string clickState: "active"

        source: isTimerRunning ? "/assets/btn-pause-"+clickState
                          : "/assets/btn-play-"+clickState

        anchors.centerIn: parent
        anchors.verticalCenterOffset: 250
        anchors.horizontalCenterOffset: 100

        MouseArea {
            anchors.fill: parent

            onClicked: {
                parent.clickState="hover"

                timerTransitionTimer.thenChange=parent
                timerTransitionTimer.running= true

                isTimerRunning= !isTimerRunning
            }
        }
    }

    Image {
        property string clickState: "active"

        source: "/assets/btn-reload-"+clickState

        anchors.centerIn: parent
        anchors.verticalCenterOffset: 250
        anchors.horizontalCenterOffset: -100

        MouseArea {
            anchors.fill: parent

            onClicked: {
                parent.clickState="hover"

                timerTransitionTimer.thenChange=parent
                timerTransitionTimer.running= true

                timerTimeLeftHours=timerStartHours
                timerTimeLeftMinutes=timerStartMinutes
                timerTimeLeftSeconds=0
            }
        }
    }

    Timer {
        id: timerTransitionTimer

        property var thenChange

        interval: 300; running: false; repeat: false

        onTriggered: {
            thenChange.clickState="active"
        }
    }
}
