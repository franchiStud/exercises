import QtQuick
import QtMultimedia

Item {
    id: root

    property int timeLeftHours: 0
    property int timeLeftMinutes: 0
    property int timeLeftSeconds: 0
    property bool isThereTimer
    property bool isRunning: true

    property bool timerEnd: true

    anchors.centerIn: parent

    Text {
        id: timeLeftTxt
        text: (root.timeLeftHours < 10
                    ? "0"+root.timeLeftHours
                    : root.timeLeftHours)
              +":"+
              (root.timeLeftMinutes < 10
                      ? "0"+root.timeLeftMinutes
                      : root.timeLeftMinutes)

        anchors.centerIn: parent
        anchors.verticalCenterOffset: -50

        font.pixelSize: 120
        color: "#FCB647"
    }

    Text {
        text: root.timeLeftSeconds < 10
            ? "0"+root.timeLeftSeconds
            : root.timeLeftSeconds

        anchors.top: timeLeftTxt.bottom
        anchors.horizontalCenter: timeLeftTxt.horizontalCenter

        font.pixelSize: 60
        color: "#9FAAB0"
    }






    Timer {
        interval: 1000; running: root.isThereTimer && root.isRunning; repeat: true
        onTriggered: {
            if(root.timeLeftSeconds <1){

                if(root.timeLeftMinutes < 1)

                    if(root.timeLeftHours < 1){
                        root.timerEnd=true
                        timerSound.play()
                    } else {
                        root.timeLeftHours--
                        root.timeLeftMinutes=59
                        root.timeLeftSeconds=59
                    }
                else {
                    root.timeLeftMinutes--
                    root.timeLeftSeconds=59
                }

            } else
                root.timeLeftSeconds--

        }
    }
    SoundEffect {
            id: timerSound
            source: "/sounds/timer.wav"
        }
}
