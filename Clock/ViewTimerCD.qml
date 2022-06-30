import QtQuick

Component {
    Item {
        id: timerCountDown

        TimerCD {
            id: timerCD
        }

        Image {
            property string clickState: "active"

            source: timerCD.isRunning ? "/assets/btn-pause-"+clickState
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

                    timerCD.isRunning= !timerCD.isRunning
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
}
