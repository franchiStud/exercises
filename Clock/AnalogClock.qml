import QtQuick

Rectangle{

    property bool alarmSet: false
    width: 418
    height: 418
    radius: 209
    color: "#1B2F46"
    x: 31
    y: 220
    DateTxt{ //Label data
           x: 209
           y: -39
           visible: true
       }

    Rectangle{ //lancetta dei minuti
        id: minuti
        width: 8
        height: 130
        color: "#FCB647"
        radius: 4
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
    Rectangle{ //lancetta delle ore
        id: ore
        width: 14
        height: 105
        color: "#FCB647"
        radius: 7
        x: cen.x+cen.width/2-7 //posizione calcolata rispetto al centro
        y: cen.y-94
        transformOrigin: Item.Bottom
        border.color: "#1B2F46"
        border.width: 2
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

    Rectangle{ //lancetta per settare la sveglia
        id: alarmLine
        visible: alarmSet ? true : false //è visibile solo se si sta settando la sveglia
        width: 4
        height: 150
        color: "#00B49D"
        radius: 7
        x: cen.x+cen.width/2-2 //si calcola la posizione in base al centro
        y: cen.y-139
        transformOrigin: Item.Bottom
        rotation: 0
    }

    Image{
        source: "/images/analog.png"
        anchors.centerIn: cen
        sourceSize.height: 375
        sourceSize.width: 375
    }

    Rectangle{ //centro
        id: cen
        anchors.centerIn: parent
        width: 22
        height: 22
        radius: 11
        color: "#FCB647"
        border.width: 2
        border.color: "#1B2F46"
    }


    function setAlarm(x){ //modifica la rotazione della lancetta allarme
        alarmLine.rotation=(x.getHours()>12 ?
                   x.getHours()-12 :
                   x.getHours())
              *30
              +30*(x.getMinutes()/60)
    }
}

