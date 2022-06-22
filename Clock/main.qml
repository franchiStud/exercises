import QtQuick

Window {
    id: root
    property bool isThereAlarm: false
    property bool isThereTimer: false
    property string view: "DeveClock"
    width: 480
    height: 800
    visible: true
    color: "#151B2E"
    title: qsTr("DeveClock")

    Item{ //Label titolo
        x: 240
        y: 58
        Text{
            anchors.centerIn: parent
            id: head
            text: root.view
            font.pixelSize: 36
            color: "#9FAAB0"
            visible: true
        }
    }

    Clock{
        visible: view==="DeveClock" ? true : false
    }

    Rectangle{ //linea (separa label "DeveClock" e label data)
        x: 40
        y: 116
        width: 400
        height: 1
        color: "#9FAAB0"
        visible: view==="DeveClock" ? true : false
    }

    Button{ //pulsante timer
        x: 18
        y: 690
        state: "stTimer"
        visible: view==="DeveClock" ? true : false
        MouseArea{
            anchors.fill: parent
            onClicked: {
            }
        }
    }
    Button{ //pulsante allarme
        x: 272
        y: 690
        state: "stAlarm"
        visible: view==="DeveClock" ? true : false
        MouseArea{
            anchors.fill: parent
            onClicked: {
            }
        }
    }

    Image{
        id: back
        source: "/assets/btn-back-active.svg"
        x: 28
        y: 20
        sourceSize.height: 80
        visible: view!=="DeveClock" ? true : false
        MouseArea{
            anchors.fill: parent
            onClicked: {

            }
        }
    }
    Image {
        y: 33
        x: 403
        source: "/assets/alarm-on-feedback.svg"
        visible: view==="DeveClock" ? root.isThereAlarm : false
    }
    Image {
        y: 33
        x: 349
        source: "/assets/timer.svg"
        visible: view==="DeveClock" ? root.isThereTimer : false
    }
}
