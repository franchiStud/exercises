import QtQuick

Image {
    id: root

    property bool direction //true: up, false: down
    property bool isHover

    anchors.horizontalCenter: parent.horizontalCenter
    y: direction ? parent.height+10
                 : parent.height+10+sourceSize.height

    rotation: direction ? 0 : 180
    source: isHover ? "/assets/btn-arrow-hover.svg"
                     : "/assets/btn-arrow-active.svg"
}
