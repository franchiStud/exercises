import QtQuick

Item {
    id: root

    property var everyDayAlarms: ListModel{}
    property var dateAlarms: ListModel{}
    property var isSelected: []
    property real howManySelected: 0
    property var deleteButton: DeleteButton{ x: 23; y: 706 }

    Text{
        text: everyDayAlarms.count>0 ? "Everyday" : ""

        x: 38
        y: 135

        font.pixelSize: 20
        color: "#FCB647"
    }

    ListView{
        id: everyDayView

        model: everyDayAlarms

        x: 29
        y: 185
        width: 180
        height: 200

        delegate: AlarmListComponent{}
    }

    Text{
        x: 38
        y: 135+(everyDayAlarms.count>0 ? everyDayAlarms.count*88+100 : 0)
        text: dateAlarms.count>0 ? "Others" : ""
        font.pixelSize: 20
        color: "#FCB647"
    }
    ListView{
        id: elenco
        model: dateAlarms
        x: 29
        y: 185+(everyDayAlarms.count>0 ? everyDayAlarms.count*88+100 : 0)
        width: 180
        height: 200
        delegate: AlarmListComponent{}
    }
}
