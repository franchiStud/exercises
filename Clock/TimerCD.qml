import QtQuick
import QtMultimedia

Item {
    id: root

    property bool isRunning: true

    anchors.centerIn: parent

    Text {
        id: timeLeftTxt
        text: (timerTimeLeftHours < 10
                    ? "0"+timerTimeLeftHours
                    : timerTimeLeftHours)
              +":"+
              (timerTimeLeftMinutes < 10
                      ? "0"+timerTimeLeftMinutes
                      : timerTimeLeftMinutes)

        anchors.centerIn: parent
        anchors.verticalCenterOffset: -50

        font.pixelSize: 120
        color: "#FCB647"
    }

    Text {
        text: timerTimeLeftSeconds < 10
            ? "0"+timerTimeLeftSeconds
            : timerTimeLeftSeconds

        anchors.top: timeLeftTxt.bottom
        anchors.horizontalCenter: timeLeftTxt.horizontalCenter

        font.pixelSize: 60
        color: "#9FAAB0"
    }

    Timer {
        interval: 1000; running: isThereTimer && root.isRunning; repeat: true
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
            id: timerSound
            source: "/sounds/timer.wav"
   }
}
