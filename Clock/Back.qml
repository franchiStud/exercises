import QtQuick

Image {
    id: root

    property int startX

    state: "disabled"

    sourceSize.height: 80

    states: [
        State {
            name: "enabled"; PropertyChanges {
                target: root
                source: "/assets/btn-back-hover.svg"
                x: root.startX-10
            }
        },
        State {
            name: "disabled"; PropertyChanges {
                target: root
                source: "/assets/btn-back-active.svg"
                x: root.startX
            }
        }
    ]

    Behavior on x {
        NumberAnimation { duration: 250 }
    }
}
