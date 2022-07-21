import QtQuick
import QtQuick.Controls 2.0

Item {
    id: root

    anchors.fill: parent

    StackView {
        id: stackViewClock

        initialItem: ac

        anchors.centerIn: parent
        width: 444
        height: 390
    }

    Component {
        id: ac;

        AnalogClock {
            MouseArea {
                anchors.fill: parent

                onClicked: stackViewClock.push(dc)
            }
        }
    }

    Component {
        id: dc;

        DigitalClock {
            MouseArea {
                anchors.fill: parent

                onClicked: stackViewClock.pop()
            }
        }
    }
}
