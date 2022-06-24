import QtQuick

Image {

    id: root

    property date currentDate: new Date()
    property var hour

    source: "/assets/comp-clock-dial-setting-alarm-mode.svg"
    x:58
    y:196

    Image { //lancetta dei minuti
        id: minuti

        source: "/assets/ic-clock-hand_mins.svg"
        sourceSize: "4x100"

        anchors.centerIn: cen
        anchors.verticalCenterOffset: -sourceSize.height/2

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

        anchors.centerIn: cen
        anchors.horizontalCenterOffset: sourceSize.width/2

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

        anchors.centerIn: cen
        anchors.verticalCenterOffset: -sourceSize.height/2

        transformOrigin: Item.Bottom
        rotation: (hour[0]>12 ? hour[0]-12 : hour[0])*30
                  + (hour[1]/60)*30
    }

    Timer { //l'ora si aggiorna ogni 0.5 secondi
        interval: 500; running: true; repeat: true;
        onTriggered: { currentDate=new Date(); }
    }


    Image { //centro
        id: cen

        source: "/assets/ic-clock-hands_center.svg"
        sourceSize: "21x21"

        anchors.centerIn: parent
    }
}

