import QtQuick

Item{
    id: root

    property string txt

    x: parent.width/2
    y: 58

    Text{
        id: head

        text: root.txt

        anchors.centerIn: parent

        font.pixelSize: 36
        color: "#9FAAB0"
    }

    Rectangle{ //linea (separa label "DeveClock" e label data)
        anchors.horizontalCenter: parent.horizontalCenter
        y: root.y
        width: 400
        height: 1

        color: "#9FAAB0"
    }
}
