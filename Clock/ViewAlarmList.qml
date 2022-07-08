import QtQuick
import QtMultimedia

Item {
    id: alarmClockList

    property var stackView

    property bool isSomethingSelected

    signal clickDelete()

    Head {
        id: head

        txt: "Alarm clock list"
    }

    DeleteButton {
        visible: isSomethingSelected

        onClick: alarmClockList.clickDelete()
    }
}
