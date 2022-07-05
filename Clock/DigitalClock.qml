import QtQuick

Item {
    id: root

    property bool alarmSet: false
    property var currentDate


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
            text: (currentDate.getHours()>12 ?
                      currentDate.getHours()-12 :
                      currentDate.getHours())
                  +":"
                  +(currentDate.getMinutes()<10 ?
                       "0" : "")
                  +currentDate.getMinutes()

            anchors.centerIn: parent

            color: "#FCB647"
            font.pixelSize: 120
        }

        Text{
            text: currentDate.getHours()>12 ? "PM" : "AM"

            anchors.horizontalCenter: clockDial.horizontalCenter
            y:292

            color: "#9FAAB0"
            font.pixelSize: 30
        }
    }

}

