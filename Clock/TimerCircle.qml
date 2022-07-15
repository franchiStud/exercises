import QtQuick
import QtQuick.Shapes

Shape {
    property real timeLeft: 1

    width: 400
    height: 400

    layer.enabled: true
    layer.samples: 4

    ShapePath {
        fillColor: "transparent"
        strokeColor: "#FCB647"
        strokeWidth: 6
        capStyle: ShapePath.RoundCap

        PathAngleArc {
            centerX: width/2;   centerY: height/2
            radiusX: width/2-5; radiusY: height/2-5

            startAngle: -90
            sweepAngle: timeLeft*360

            Behavior on sweepAngle {
                NumberAnimation { duration: 1000 }
            }
        }
    }
}
