import QtQuick

Item {
    property var currentDate

    width: clockDial.width
    height: clockDial.height

    Image {
        id: clockDial

        source: "/assets/comp-clock-dial.svg"

        anchors.centerIn: parent
        anchors.verticalCenterOffset: 50

        DateTxt { //Label data
            x: parent.width/2
            y: -42

            visible: true
        }

        Image { //lancetta dei minuti
            id: minuti

            source: "/assets/ic-clock-hand_mins.svg"

            anchors.centerIn: cen
            anchors.verticalCenterOffset: -sourceSize.height/2

            transformOrigin: Item.Bottom //rotazione calcolata in base ai minuti
            rotation: currentDate.getMinutes()*6

            Behavior on rotation {
                NumberAnimation { duration: 200 }
            }
        }

        Image { //lancetta delle ore
            id: ore

            source: "/assets/ic-clock-hand_hours.svg"

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



        Image { //centro
            id: cen

            source: "/assets/ic-clock-hands_center.svg"

            anchors.centerIn: parent
        }
    }


}

