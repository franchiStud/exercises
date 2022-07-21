import QtQuick

Item {
    id: root

    width: clockDial.width
    height: clockDial.height

    Rectangle {
        id: clockDial

        anchors.centerIn: parent
        width: stackViewClock.width
        height: stackViewClock.height
        radius: 40

        color: "#1B2F46"

        DateTxt { //Label data
            anchors.horizontalCenter: clockDial.horizontalCenter
            y: 40

            visible: true
        }

        Text {
            text: Qt.formatDateTime(currentDate.date, "h")>12
                     ? Qt.formatDateTime(currentDate.date, "hh:mm AP").replace("PM","")
                     : Qt.formatDateTime(currentDate.date, "hh:mm AP").replace("AM","")

            anchors.centerIn: parent

            color: "#FCB647"
            font.pixelSize: 120
        }

        Text{
            text: Qt.formatDateTime(currentDate.date, "h")>12 ? "PM" : "AM"

            anchors.horizontalCenter: clockDial.horizontalCenter
            y:292

            color: "#9FAAB0"
            font.pixelSize: 30
        }
    }

}
