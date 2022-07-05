import QtQuick

MouseArea {
    property bool doPush: true
    property var nextStackView
    property var stackView
    anchors.fill: parent

    onReleased: {
        if(doPush)
            stackView.push(nextStackView)
        else
            stackView.pop()
    }
}
