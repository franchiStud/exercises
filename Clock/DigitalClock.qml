import QtQuick

Rectangle {
    id: root

    property bool alarmSet: false
    property var currentDate: new Date()

    anchors.centerIn: parent
    width: 444
    height: 390
    radius: 40

    color: "#1B2F46"

    DateTxt { //Label data
        anchors.horizontalCenter: root.horizontalCenter
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

        Timer {
            interval: 500; running: true; repeat: true
            onTriggered: { currentDate= new Date() }
        }
    }

    Text{
        text: currentDate.getHours()>12 ? "PM" : "AM"

        anchors.horizontalCenter: root.horizontalCenter
        y:292

        color: "#9FAAB0"
        font.pixelSize: 30

        Timer{
            interval: 500; running: true; repeat: true
            onTriggered: { parent.text=new Date().getHours()>12? "PM"
                                                               : "AM" }
        }
    }
}
