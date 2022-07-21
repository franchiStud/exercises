import QtQuick

Item {
    id: root

    anchors.centerIn: parent

    Rectangle {
        anchors.centerIn: parent
        anchors.verticalCenterOffset: -90
        anchors.horizontalCenterOffset: -100

        width: 190
        height: 290
        radius: width/8

        color: "#1B2F46"

        Text {
            id: day

            text: Qt.formatDateTime(alarms.date,"dd")

            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            y: 104

            width: parent.width

            color: "#FCB647"
            font.pixelSize: 120
        }

        Text {
            id: weekDay

            text: Qt.formatDateTime(alarms.date,"ddd")

            anchors.horizontalCenter: day.horizontalCenter
            anchors.bottom: day.top

            width: parent.width

            color: "#9FAAB0"
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 50
        }

        Text {
            id: restOfDate

            text: Qt.formatDateTime(alarms.date,"/MM/yyyy")

            x: parent.width+18
            anchors.verticalCenter: day.verticalCenter

            width: parent.width

            color: "#9FAAB0"
            font.pixelSize: 40
            font.letterSpacing: 2
        }

        SetArrow {
            direction: true

            isHover: upMA.containsPress

            MouseArea{
                id: upMA

                anchors.fill: parent
                onClicked: {
                    alarms.dateAddDays(1)
                }
            }
        }

        SetArrow {
            direction: false

            isHover: downMA.containsPress

            MouseArea {
                id: downMA

                anchors.fill: parent
                onClicked: {
                    alarms.dateAddDays(-1)
                }
            }
        }
    }
}
