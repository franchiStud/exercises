import QtQuick

Rectangle{
    property bool alarmSet: false

    x: 18
    y: 160
    width: 444
    height: 390
    radius: 40

    color: "#1B2F46"

    DateTxt{ //Label data
        x: 222
        y: 40

        visible: true
    }

    Text {
        text: (new Date().getHours()>12 ?
                  new Date().getHours()-12 :
                  new Date().getHours())
              +":"
              +(new Date().getMinutes()<10 ?
                   "0" : "")
              +new Date().getMinutes()

        anchors.centerIn: parent

        color: "#FCB647"
        font.pixelSize: 120

        Timer{
            interval: 500; running: true; repeat: true
            onTriggered: {
                parent.text=(new Date().getHours()>12 ?
                                 new Date().getHours()-12 :
                                 new Date().getHours())
                            +":"
                            +(new Date().getMinutes()<10 ?
                                 "0" : "")
                            +new Date().getMinutes()
            }
        }
    }

    Text{
        text: new Date().getHours()>12 ? "PM" : "AM"

        y:292
        x:192

        color: "#9FAAB0"
        font.pixelSize: 30

        Timer{
            interval: 500; running: true; repeat: true
            onTriggered: { parent.text=new Date().getHours()>12? "PM"
                                                               : "AM" }
        }
    }
}
