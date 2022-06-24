import QtQuick

Item {

    id: root

    property var hourSet: [6,0]
    property bool isActive

    AlarmAnalogClock{
        id: analogClock
        hour: root.hourSet
    }

    Image {
        id: slider
        x: -12
        y: 578
        source: "/assets/comp-slider.svg"
    }

    Text{
        id: txt

        x: cursor.x+32
        y: slider.y-18

        text: "6:00"

        font.pixelSize: 24
        color: "#00B49D"
    }

    Image{
        id: cursor

        property bool pressed: false

        source: pressed ? "/assets/handle-pressed.svg" : "/assets/handle-enable.svg"

        x: dragArea.drag.minimumX
        y: slider.y+12
    }

    MouseArea{
        id: dragArea

        anchors.left: slider.left
        anchors.right: slider.right
        anchors.top: slider.verticalCenter
        anchors.bottom: cursor.bottom

        drag.target: cursor
        drag.axis: Drag.XAxis
        drag.maximumX: 378
        drag.minimumX: slider.x
    }

    Timer{
        interval: 10; repeat: root.isActive; running: root.isActive
        onTriggered: {
            if(dragArea.drag.active){
                cursor.pressed=true

                var hourWidth=Math.abs((dragArea.drag.minimumX)
                    +Math.abs(dragArea.drag.maximumX))/18
                var tenMinutesWidth=hourWidth/6

                var posM=(cursor.x-dragArea.drag.minimumX)%hourWidth

                hourSet[0]=Math.round(5.5+(cursor.x-dragArea.drag.minimumX)
                                      /hourWidth)
                txt.text=hourSet[0]+":"

                if(posM<=(tenMinutesWidth*1))
                    hourSet[1]=0
                else if(posM<=(tenMinutesWidth*2))
                    hourSet[1]=10
                else if(posM<=(tenMinutesWidth*3))
                    hourSet[1]=20
                else if(posM<=(tenMinutesWidth*4))
                    hourSet[1]=30
                else if(posM<=(tenMinutesWidth*5))
                    hourSet[1]=40
                else
                    hourSet[1]=50

                txt.text+=hourSet[1]
                analogClock.hour=hourSet
            } else
                cursor.pressed=false
        }
    }
}
