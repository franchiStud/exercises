import QtQuick

Rectangle {
    id: root

    property string buttonTxt
    property var onClick: ({})
    property bool clickEnabled: true
    property bool isClicked: mouseAreaS.containsPress
    property var stackView

    anchors.centerIn: parent
    anchors.verticalCenterOffset: 340

    width: 434
    height: buttonHeight
    radius: buttonHeight/2

    visible: true

    border.color: "#00A6E2"
    border.width: 1

    color: mouseAreaS.containsPress
            ? "#00A6E2"
            : "#151B2E"

    Text {
       id: txt

       text: buttonTxt

       anchors.centerIn: parent

       color: mouseAreaS.containsPress
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

    NextPageButton {
        id: mouseAreaS

        stackView: root.stackView
        enabled: clickEnabled
        doPush: false
        onClicked: onClick
    }
}
