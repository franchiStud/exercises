import QtQuick

Image {
    id: root

    property int startX
    property var stackView

    source: mouseArea.containsPress
            ? "/assets/btn-back-hover.svg"
            : "/assets/btn-back-active.svg"
    sourceSize.height: 80

    x: mouseArea.containsPress
            ? root.startX-10
            : root.startX

    Behavior on x {
        NumberAnimation { duration: 250 }
    }

    Behavior on opacity {
        NumberAnimation { duration: 200 }
    }

    MouseArea {
        id: mouseArea

        anchors.fill: parent
        onClicked: stackView.pop()
    }
}
