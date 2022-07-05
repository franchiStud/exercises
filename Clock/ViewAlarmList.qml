import QtQuick
import QtMultimedia

Item {
    id: alarmClockList

    property var stackView

    Head {
        id: head

        txt: "Alarm clock list"
    }

    AlarmList {
        id: alarmListObj
    }

    DeleteButton {
        visible: alarmListObj.howManySelected>0
    }
}
