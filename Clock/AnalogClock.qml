import QtQuick

Image{
    source: "/assets/comp-clock-dial.svg"
    property bool alarmSet: false
    y: 210
    DateTxt{ //Label data
           x: parent.width/2
           y: -42
           visible: true
       }

    Image{ //lancetta dei minuti
        id: minuti
        width: 8
        height: 130
        source: "/assets/ic-clock-hand_mins.svg"
        x: cen.x+cen.width/2-4 //posizione calcolata rispetto al centro
        y: cen.y-119
        transformOrigin: Item.Bottom //rotazione calcolata in base ai minuti
        rotation: new Date().getMinutes()*6
        Timer{ //l'ora si aggiorna ogni 0.5 secondi
            interval: 500; running: true; repeat: true;
            onTriggered: {
                parent.rotation=new Date().getMinutes()*6 }
        }
    }
    Image{ //lancetta delle ore
        id: ore
        width: 14
        height: 105
        source: "/assets/ic-clock-hand_hours.svg"
        x: cen.x+cen.width/2-7 //posizione calcolata rispetto al centro
        y: cen.y-94
        transformOrigin: Item.Bottom
        rotation: ( //calcolo dell'ora:
                      new Date().getHours()>12 ?// se è più di mezzogiorno si sottrae 12 all'orario
                       new Date().getHours()-12 :
                       new Date().getHours())//altrimenti si lascia l'orario così com'è
                  *30// si moltiplica per 30 (numero di gradi da cui "distano" tra di loro le ore)
                  +30*(new Date().getMinutes()/60) //si somma ai minuti
        Timer{ //l'ora si aggiorna ogni 0.5 secondi
            interval: 500; running: true; repeat: true;
            onTriggered: {
                parent.rotation=(new Date().getHours()>12 ?
                                     new Date().getHours()-12 :
                                     new Date().getHours())
                                *30
                                +30*(new Date().getMinutes()/60)
            }
        }
    }


    Image{ //centro
        id: cen
        anchors.centerIn: parent
        source: "/assets/ic-clock-hands_center.svg"
    }


    function setAlarm(x){ //modifica la rotazione della lancetta allarme
        alarmLine.rotation=(x.getHours()>12 ?
                   x.getHours()-12 :
                   x.getHours())
              *30
              +30*(x.getMinutes()/60)
    }
}

