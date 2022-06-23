import QtQuick

Item {
    id: root
    property var hourSet: [6,0]
    property bool isActive
    AlarmAnalogClock{
        id: analogClock
    }

    Image {
        x: -12
        y: 578
        source: "/assets/comp-slider.svg"
    }
    Text{
        id: txt
        x: 19
        y: 560
        text: "6:00"
        font.pixelSize: 24
        color: "#00B49D"
    }
    Image{
        id: cursor
        x: -13
        y: 590
        state: "enable"
        states:[
            State{
                name: "enable"
                PropertyChanges {
                    target: cursor
                    source: "/assets/handle-enable.svg"
                }
            },
            State{
                name: "pressed"
                PropertyChanges {
                    target: cursor
                    source: "/assets/handle-pressed.svg"
                }
            }
        ]
    }

    MouseArea{
        id: dragArea
        height: 60
        width: 440
        x: 20
        y: 610
        drag.target: cursor
        drag.axis: Drag.XAxis
        drag.maximumX: 378
        drag.minimumX: -13
    }
    Timer{
        interval: 10; repeat: root.isActive; running: root.isActive
        onTriggered: {
            if(dragArea.drag.active){
                txt.x=cursor.x+32
                txt.text=(Math.round(5.5+(cursor.x+13)/21.66667))+":"
                hourSet[0]=(Math.round(5.5+(cursor.x+13)/21.66667))

                if((Math.round((cursor.x+13)%21.66667))<=3){
                    hourSet[1]=0
                    txt.text+="00"
                }else if((Math.round((cursor.x+13)%21.66667))<=6){
                    hourSet[1]=10
                    txt.text+="10"
                }else if((Math.round((cursor.x+13)%21.66667))<=10){
                    hourSet[1]=20
                    txt.text+="20"
                }else if((Math.round((cursor.x+13)%21.66667))<=13){
                    hourSet[1]=30
                    txt.text+="30"
                }else if((Math.round((cursor.x+13)%21.66667))<=16){
                    hourSet[1]=40
                    txt.text+="40"
                }else{
                    hourSet[1]=50
                    txt.text+="50"
                }
                analogClock.setAlarm(hourSet)
            }
        }
    }
}
