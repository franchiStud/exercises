import QtQuick

Item {
    id: root

    property var buttonHourValue
    signal hourChanged

    anchors.centerIn: parent

    AlarmAnalogClock {
        id: analogClock

        buttonDateValue: root.buttonHourValue
        onButtonDateValueChanged: root.buttonHourValue=buttonDateValue

        anchors.centerIn: parent
    }

    Image {
        id: slider

        source: "/assets/comp-slider.svg"

        anchors.centerIn: parent
        anchors.verticalCenterOffset: 220
    }

    Text {
        id: txt

        x: cursor.x+32
        y: slider.y-18

        text: "6:00"

        font.pixelSize: 24
        color: "#00B49D"
    }

    Image {
        id: cursor

        property bool pressed: dragArea.drag.active

        source: pressed ? "/assets/handle-pressed.svg" : "/assets/handle-enable.svg"

        x: dragArea.drag.minimumX
        y: slider.y+12

        onXChanged: {
            var hourSetApp=buttonHourValue

            if(dragArea.drag.maximumX<cursor.x) return

            var hourWidth=Math.abs((dragArea.drag.minimumX)
                +Math.abs(dragArea.drag.maximumX))/5.3
            var tenMinutesWidth=hourWidth/6

            var posM=(cursor.x-dragArea.drag.minimumX)%hourWidth

            hourSetApp.setHours(Math.round(
                        5.5+(cursor.x-dragArea.drag.minimumX)
                        / hourWidth)%24)


            if(posM<=(tenMinutesWidth*1))
                hourSetApp.setMinutes(0)
            else if(posM<=(tenMinutesWidth*2))
                hourSetApp.setMinutes(10)
            else if(posM<=(tenMinutesWidth*3))
                hourSetApp.setMinutes(20)
            else if(posM<=(tenMinutesWidth*4))
                hourSetApp.setMinutes(30)
            else if(posM<=(tenMinutesWidth*5))
                hourSetApp.setMinutes(40)
            else
                hourSetApp.setMinutes(50)

            buttonHourValue=hourSetApp
            txt.text=buttonHourValue.getHours()+
                    ":"+
                    ((buttonHourValue.getMinutes() < 10)
                            ? "00"
                            : buttonHourValue.getMinutes())
            root.hourChanged()
        }
    }


    MouseArea {
        id: dragArea

        anchors.left: slider.left
        anchors.right: slider.right
        anchors.top: slider.verticalCenter
        anchors.bottom: cursor.bottom

        drag.target: cursor
        drag.axis: Drag.XAxis
        drag.maximumX: slider.x+390
        drag.minimumX: slider.x
    }
}
