import QtQuick

Image{
    id: root
    property bool direction //true: up, false: down
    x: 28
    y: direction ? 440 : 551
    rotation: direction ? 0 : 180
    states: [
        State {
            name: "active"
            PropertyChanges {
                target: root
                source: "/assets/btn-arrow-active.svg"
            }
        },
        State {
            name: "hover"
            PropertyChanges {
                target: root
                source: "/assets/btn-arrow-hover.svg"
            }
        }
    ]
}

