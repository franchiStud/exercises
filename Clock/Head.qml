import QtQuick

Item {
    id: root

    property string txt: "DeveClock"

    anchors.horizontalCenter: parent.horizontalCenter
    anchors.verticalCenter: parent.top
    anchors.verticalCenterOffset: 60

    Text {
        id: headTxt

        text: root.txt

        anchors.centerIn: parent

        font.pixelSize: 36
        color: "#9FAAB0"
    }

    Rectangle {
        anchors.centerIn: parent
        anchors.verticalCenterOffset: 50
        width: 400
        height: 1

        color: "#9FAAB0"
    }
}
