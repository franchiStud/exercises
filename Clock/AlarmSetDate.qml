import QtQuick

Item {
    id: root

    property var newDate: new Date()

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

            text: newDate.getDate()

            anchors.horizontalCenter: parent.horizontalCenter
            y: 104
            width: parent.width

            color: "#FCB647"
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 120
        }
        Text {
            id: weekDay

            text: {
                switch(root.newDate.getDay()){
                    case 0: return "Sun"
                    case 1: return "Mon"
                    case 2: return "Tue"
                    case 3: return "Wed"
                    case 4: return "Thu"
                    case 5: return "Fri"
                    case 6: return "Sat"
                }
            }

            anchors.horizontalCenter: day.horizontalCenter
            anchors.bottom: day.top
            width: parent.width

            color: "#9FAAB0"
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 50
        }

        Text {
            id: restOfDate

            text: "/"+root.newDate.getMonth()+"/"+root.newDate.getFullYear()

            x: parent.width+18
            anchors.verticalCenter: day.verticalCenter
            width: parent.width


            color: "#9FAAB0"
            font.pixelSize: 40
            font.letterSpacing: 2
        }

        SetArrow {
            direction: true

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    var updateDate= root.newDate

                    updateDate.setDate(updateDate.getDate()+1)

                    root.newDate=updateDate

                    arrowTimer.thenChange=parent
                    arrowTimer.running=true
                }
            }
        }

        SetArrow {
            direction: false

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    var updateDate= root.newDate

                    updateDate.setDate(updateDate.getDate()-1)

                    root.newDate=updateDate

                    arrowTimer.thenChange=parent
                    arrowTimer.running=true
                }
            }
        }
    }

    Timer {
        id: arrowTimer

        property var thenChange

        interval: 150; running: false; repeat: false
        onTriggered: thenChange.state= "active"
    }
}
