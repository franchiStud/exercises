import QtQuick

Window {
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
            text: "DeveClock"
            font.pixelSize: 36
            color: "#9FAAB0"
            visible: true
        }
    }

    AnalogClock{// orologio analogico
        id: ac
        visible: true
    }

    DigitalClock{// orologio digitale
        id: dc
        visible: false
    }




    Rectangle{ //linea (separa label "DeveClock" e label data)
        x: 40
        y: 116
        width: 400
        height: 1
        color: "#9FAAB0"
        visible: true
    }

    Button{ //pulsante timer
        x: 18
        y: 690
        state: "stTimer"
        visible: true
        MouseArea{
            anchors.fill: parent
            onClicked: {
                head.text="Timer"
                back.visible=true
            }
        }
    }
    Button{ //pulsante allarme
        x: 272
        y: 690
        state: "stAlarm"
        visible: true
        MouseArea{
            anchors.fill: parent
            onClicked: {
                head.text="Alarm"
                back.visible= true
            }
        }
    }

    Image{
        id: back
        source: "/assets/btn-back-active.svg"
        x: 28
        y: 20
        sourceSize.height: 80
        visible: false
        MouseArea{
            anchors.fill: parent
            onClicked: {

            }
        }
    }
}
