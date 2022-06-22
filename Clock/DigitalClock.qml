import QtQuick

Rectangle{
    property bool alarmSet: false
    width: 444
    height: 390
    radius: 40
    color: "#1B2F46"
    x: 18
    y: 160
    DateTxt{ //Label data
        x: 222
        y: 40
        visible: true
    }
    Text {
        color: "#FCB647"
        anchors.centerIn: parent
        font.pixelSize: 120
        text: (new Date().getHours()>12 ?
                  new Date().getHours()-12 :
                  new Date().getHours())
              +":"
              +(new Date().getMinutes()<10 ?
                   "0" : "")
              +new Date().getMinutes()
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
        color: "#9FAAB0"
        font.pixelSize: 30
        y:292
        x:192
        text: new Date().getHours()>12 ? "AM" : "PM"
        Timer{
            interval: 500; running: true; repeat: true
            onTriggered: {
                parent.text=new Date().getHours()>12 ? "AM" : "PM"
            }
        }
    }
}
