import QtQuick
import QtMultimedia

Component {

    Item {
        id: alarmClockList

        AlarmList {
            id: alarmListObj
        }

        DeleteButton {
            visible: alarmListObj.howManySelected>0
        }
    }
}
