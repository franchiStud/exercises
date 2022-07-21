import QtQuick
import QtMultimedia

Item {
    id: root
    anchors.centerIn: parent

    Text {
        id: timeLeftTxt
        text: (timerValues.leftHours < 10
                    ? "0"+timerValues.leftHours
                    : timerValues.leftHours)
              +":"+
              (timerValues.leftMinutes < 10
                      ? "0"+timerValues.leftMinutes
                      : timerValues.leftMinutes)

        anchors.centerIn: parent
        anchors.verticalCenterOffset: -50

        font.pixelSize: 120
        color: "#FCB647"
    }

    Text {
        text: timerValues.leftSeconds < 10
            ? "0"+timerValues.leftSeconds
            : timerValues.leftSeconds

        anchors.top: timeLeftTxt.bottom
        anchors.horizontalCenter: timeLeftTxt.horizontalCenter

        font.pixelSize: 60
        color: "#9FAAB0"
    }
}
