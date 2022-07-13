import QtQuick

Rectangle {
    id: root

    property int value: 0
    property string txt
    property int verticalOffset: -30

    anchors.horizontalCenter: parent.horizontalCenter
    anchors.verticalCenter: parent.verticalCenter
    anchors.verticalCenterOffset: -120

    width: 190
    height: 280
    radius: width/6

    color: "#1B2F46"

    Text {
        text: value < 10
              ? "0" + value
              : value

        anchors.centerIn: parent
        anchors.verticalCenterOffset: verticalOffset

        font.pixelSize: 120
        color: "#FCB647"
    }

    Text {
        text: root.txt
        anchors.centerIn: parent
        anchors.verticalCenterOffset: 70

        font.pixelSize: 20
        color: "#9FAAB0"
    }

    Item {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.bottom

        SetArrow {
            direction: true
            isHover: upArrow.pressed()

            MouseArea {
                id: upArrow
                anchors.fill: parent
                onClicked:
                    { root.value = (root.value+1)%60 }
            }
        }
        SetArrow {
            direction: false
            isHover: downArrow.pressed()

            MouseArea {
                id: downArrow
                anchors.fill: parent
                onClicked:
                    { root.value = (root.value === 0) ? 59 : root.value-1 }
            }
        }
    }
}
