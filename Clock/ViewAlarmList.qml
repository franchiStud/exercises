import QtQuick
import QtMultimedia

Item {
    id: alarmClockList

    property var stackView

    signal clickDelete()

    Head {
        id: head

        txt: "Alarm clock list"
    }

    DeleteButton {
        visible: alarmListObj.howManySelected>0

        onClick: alarmClockList.clickDelete()
    }
}
