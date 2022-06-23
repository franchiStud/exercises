import QtQuick

Image {
    id: root
    source: "/assets/comp-clock-dial-setting-alarm-mode.svg"
    property date currentDate: new Date()
    x:58
    y:196
    Image { //lancetta dei minuti
        id: minuti
        source: "/assets/ic-clock-hand_mins.svg"
        sourceSize: "4x100"
        x: cen.x+cen.width/2 //posizione calcolata rispetto al centro
        y: cen.y-87
        transformOrigin: Item.Bottom //rotazione calcolata in base ai minuti
        rotation: currentDate.getMinutes()*6
        Behavior on rotation {
            NumberAnimation{ duration: 200 }
        }
    }
    Image { //lancetta delle ore
        id: ore
        source: "/assets/ic-clock-hand_hours.svg"
        sourceSize: "83x9"
        x: cen.x+cen.width/2 //posizione calcolata rispetto al centro
        y: cen.y+cen.height/2-5
        transformOrigin: Item.Left
        rotation: (currentDate.getHours()>12 ?
                      currentDate.getHours()-12 :
                      currentDate.getHours())
                 *30
                 +30*(currentDate.getMinutes()/60)
                 -90
        Behavior on rotation {
            NumberAnimation { duration: 200 }
        }
    }

    Image { //lancetta alarm
        id: alarmLine
        source: "/assets/ic-clock-hand-alarm.svg"
        sourceSize: "4x100"
        x: cen.x+cen.width/2-2 //posizione calcolata rispetto al centro
        y: cen.y-87
        transformOrigin: Item.Bottom
        rotation: 180
    }

    Timer { //l'ora si aggiorna ogni 0.5 secondi
        interval: 500; running: true; repeat: true;
        onTriggered: {
            currentDate=new Date();
            ore.rotation=(currentDate.getHours()>12 ?
                                 currentDate.getHours()-12 :
                                 currentDate.getHours())
                            *30
                            +30*(currentDate.getMinutes()/60)
                            -90
            minuti.rotation=currentDate.getMinutes()*6
        }
    }

    Image { //centro
        id: cen
        x: 172
        y: 159
        source: "/assets/ic-clock-hands_center.svg"
        sourceSize: "21x21"
    }

    function setAlarm(x){ //modifica la rotazione della lancetta allarme
        alarmLine.rotation=(x[0]>12 ?
                   x[0]-12 : x[0])*30
              +30*(x[1]/60)
    }
}

