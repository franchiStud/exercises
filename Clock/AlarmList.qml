import QtQuick

Item {
    id: root

    property var everyDayAlarms: ListModel {}
    property var dateAlarms: ListModel {}
    property var isSelected: []
    property real howManySelected: 0
    property var deleteButton: DeleteButton {}

    property var everydayToOthersDistance: everyDayAlarms.count > 0
                                        ? everyDayAlarms.count * 88 + 120
                                        : 0



    Text {
        id: everyDayTxt

        text: everyDayAlarms.count>0 ? "Everyday" : ""

        anchors.centerIn: parent
        anchors.horizontalCenterOffset: -160
        anchors.verticalCenterOffset: -250

        font.pixelSize: 20
        color: "#FCB647"
    }

    ListView {
        id: everyDayView

        model: everyDayAlarms

        anchors.centerIn: parent
        anchors.verticalCenterOffset: -80
        width: 424
        height: 264

        clip: true

        delegate: AlarmListComponent {}
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
        anchors.verticalCenterOffset: everydayToOthersDistance + 40 +
                                      dateAlarmsTxt.font.pixelSize * 5

        clip: true

        height: everyDayView.height

        delegate: AlarmListComponent {}
    }
}
