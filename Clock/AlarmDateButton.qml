import QtQuick

Rectangle {
    id: root

    property string buttonTxt

    anchors.verticalCenter: parent.verticalCenter
    anchors.verticalCenterOffset: -235

    width: 192
    height: 50
    radius: height/2

    border.width: 1
    color: "#2b3e53"

    Image {
        id: tick

        x: 17
        y: 7
    }

    Text{
        id: txt

        text: buttonTxt

        x: 60
        y: 10

        font.pixelSize: 24
    }

    states: [

        State {
            name: "selected"
            PropertyChanges {
                target: root
                border.color: "white"
            }

            PropertyChanges {
                target: txt
                color: "white"
            }

            PropertyChanges {
                target: tick
                source: "/assets/ic-tick-selected"
            }
        },

        State {
            name: "disabled"
            PropertyChanges {
                target: root
                border.color: "#2b3e53"
            }

            PropertyChanges {
                target: txt
                color: "white"
            }

            PropertyChanges {
                target: tick
                source: "/assets/ic-tick-disabled"
            }
        }
    ]

}
