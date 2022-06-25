import QtQuick

Item {
    id: root

    property var everyDayAlarms: ListModel {}
    property var dateAlarms: ListModel {}
    property var isSelected: []
    property real howManySelected: 0
    property var deleteButton: DeleteButton {
                                    x: 23;
                                    y: 706 }

    property var everydayToOthersDistance: everyDayAlarms.count > 0
                                        ? everyDayAlarms.count * 88 + 100
                                        : 0

    Text {
        id: everyDayTxt

        text: everyDayAlarms.count>0 ? "Everyday" : ""

        x: 38
        y: 135

        font.pixelSize: 20
        color: "#FCB647"
    }

    ListView {
        id: everyDayView

        model: everyDayAlarms

        x: 29
        y: 185
        width: 180
        height: 200

        delegate: AlarmListComponent{}
    }

    Text {
        id: dateAlarmsTxt

        anchors.left: everyDayTxt.left
        y: everyDayTxt.y + everydayToOthersDistance


        text: dateAlarms.count > 0 ? "Others" : ""

        font.pixelSize: 20
        color: "#FCB647"
    }

    ListView {
        id: dateView

        model: dateAlarms

        anchors.left: everyDayView.left
        anchors.right: everyDayView.right
        anchors.verticalCenter: everyDayView.top
        anchors.verticalCenterOffset: everydayToOthersDistance +
                                      dateAlarmsTxt.font.pixelSize * 5

        height: everyDayView.height

        delegate: AlarmListComponent {}
    }
}
