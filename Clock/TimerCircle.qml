import QtQuick
import QtQuick.Shapes 1.15

Shape {
    property var timeLeft: 1
    width: 400
    height: 400
    anchors.verticalCenter: parent.verticalCenter
    anchors.verticalCenterOffset: -30
    anchors.right: parent.right

    rotation: -90
    layer.enabled: true
    layer.samples: 4

    ShapePath {
        fillColor: "transparent"
        strokeColor: "#FCB647"
        strokeWidth: 6
        capStyle: ShapePath.RoundCap

        PathAngleArc {
            centerX: width/2; centerY: height/2
            radiusX: 195; radiusY: 195
            startAngle: 0
            sweepAngle: timeLeft*360

            Behavior on sweepAngle {
                NumberAnimation { duration: 1000 }
            }
        }
    }
}
