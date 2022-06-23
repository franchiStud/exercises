import QtQuick

Image {
    source: "/assets/comp-clock-dial.svg"
    property date currentDate: new Date()
    y: 210
    DateTxt { //Label data
           x: parent.width/2
           y: -42
           visible: true
       }

    Image { //lancetta dei minuti
        id: minuti
        source: "/assets/ic-clock-hand_mins.svg"
        x: cen.x+cen.width/2-4 //posizione calcolata rispetto al centro
        y: cen.y-119
        transformOrigin: Item.Bottom //rotazione calcolata in base ai minuti
        rotation: currentDate.getMinutes()*6
        Behavior on rotation {
            NumberAnimation{ duration: 200 }
        }
    }
    Image { //lancetta delle ore
        id: ore
        source: "/assets/ic-clock-hand_hours.svg"
        x: cen.x+cen.width/2 //posizione calcolata rispetto al centro
        y: cen.y+cen.height/2-6
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
        anchors.centerIn: parent
        source: "/assets/ic-clock-hands_center.svg"
    }
}

