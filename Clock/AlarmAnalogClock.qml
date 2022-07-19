import QtQuick

Image {
    id: root
    property var buttonDateValue

    source: "/assets/comp-clock-dial-setting-alarm-mode.svg"

    Image { //minute hand
        id: mins

        source: "/assets/ic-clock-hand_mins.svg"
        sourceSize: "4x100"

        anchors.centerIn: cen
        anchors.verticalCenterOffset: -sourceSize.height/2

        transformOrigin: Item.Bottom
        rotation: Qt.formatDateTime(currentDate.date, "m")*6

        Behavior on rotation {
            NumberAnimation{ duration: 200 }
        }
    }

    Image { //hour hand
        id: hours

        source: "/assets/ic-clock-hand_hours.svg"
        sourceSize: "83x9"

        anchors.centerIn: cen
        anchors.horizontalCenterOffset: sourceSize.width/2

        transformOrigin: Item.Left
        rotation: Qt.formatDateTime(currentDate.date, "h")>12 ?
                      Qt.formatDateTime(currentDate.date, "h")-12 :
                      Qt.formatDateTime(currentDate.date, "h")
                 *30
                 +30*(Qt.formatDateTime(currentDate.date, "m")/60)
                 -90

        Behavior on rotation {
            NumberAnimation { duration: 200 }
        }
    }

    Image { //alarm hand
        id: alarmLine

        source: "/assets/ic-clock-hand-alarm.svg"
        sourceSize: "4x100"

        anchors.centerIn: cen
        anchors.verticalCenterOffset: -sourceSize.height/2

        transformOrigin: Item.Bottom
        rotation: (buttonDateValue.getHours()>12
                        ? buttonDateValue.getHours()-12
                        : buttonDateValue.getHours())*30
                  + (buttonDateValue.getMinutes()/60)*30
    }

    Timer { //hour refreshes every 0.5 secs
        interval: 500; running: true; repeat: true;
        onTriggered: { currentDate=new Date(); }
    }


    Image { //center
        id: cen

        source: "/assets/ic-clock-hands_center.svg"
        sourceSize: "21x21"

        anchors.centerIn: parent
        anchors.verticalCenterOffset: -10
    }
}
