import QtQuick

Image {
    id: root

    x: 28
    y: 20

    sourceSize.height: 80

    states: [
        State {
            name: "enabled"; PropertyChanges {
                target: root
                source: "/assets/btn-back-hover.svg"
                x: root.x-10
            }
        },
        State {
            name: "disabled"; PropertyChanges {
                target: root
                source: "/assets/btn-back-active.svg"
                x: root.x
            }
        }
    ]

    Behavior on x {
        NumberAnimation { duration: 250 }
    }
}
