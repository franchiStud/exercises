import QtQuick

Item {
    id: root
    property var alarms: ListModel{
        ListElement{hours:34;minutes:23}
        ListElement{hours:6;minutes:1}
    }
    ListView{
        model: root.alarms
        //---------------------------------- da finire!!

        delegate: Rectangle{
            width: 400
            height: 35
            color:"lightgrey"
            Row{
                spacing: 10
                Text {
                    text: hours+":"+(minutes<10 ? "00" : minutes)
                    font.pixelSize: 20
                }
            }
        }
    }
}
