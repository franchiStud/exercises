import QtQuick
import QtMultimedia

Item {
    id: root
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


}
