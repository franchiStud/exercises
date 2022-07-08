import QtQuick

Item {
    id: timerCountDown

    property var stackView

    signal clickReset()
    signal clickPause()

    Head {
        id: head

        txt: "Timer"
    }

    TimerCD {
        id: timerCD
    }

    Image {
        property bool clicked

        source: isTimerRunning
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
                onClicked: timerCountDown.clickPause()
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

            onClicked: timerCountDown.clickReset()
        }
    }
}
