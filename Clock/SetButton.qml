import QtQuick

Rectangle {
    id: root

    property string buttonTxt
    property bool isClicked: mouseAreaS.containsPress

    signal click()

    anchors.centerIn: parent
    anchors.verticalCenterOffset: 340

    width: 434
    height: buttonHeight
    radius: buttonHeight/2

    visible: true

    border.color: "#00A6E2"
    border.width: 1

    color: isClicked
            ? "#00A6E2"
            : "#151B2E"

    Text {
       id: txt

       text: buttonTxt

       anchors.centerIn: parent

       color: isClicked
                ? "white"
                : "#00A6E2"
       font.family: "Buenos Aires"
       font.pixelSize: 36
       font.letterSpacing: 1.8

       Behavior on color {
           ColorAnimation { duration: 250 }
       }
    }

    Behavior on color {
        ColorAnimation { duration: 250 }
    }

    MouseArea {
        id: mouseAreaS
        anchors.fill: parent

        onClicked: root.click()
    }
}
