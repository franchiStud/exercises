import QtQuick
Item{
    anchors.centerIn: parent

    Canvas {
        id:root

        anchors.centerIn: parent
        anchors.verticalCenterOffset: -30

        width: 396
        height: 284

        onPaint: {
            var ctx = getContext("2d");
            ctx.lineWidth = 1;
            ctx.strokeStyle = "#9FAAB0"
            ctx.beginPath()

            var pathW=0;
            do {
                pathW+=15
                ctx.moveTo(pathW,0)
                pathW+=5
                ctx.lineTo(pathW,0)

                pathW-=5
                ctx.moveTo(pathW,root.height)
                pathW+=5
                ctx.lineTo(pathW,root.height)

            } while(pathW<root.width)

            pathW=0;
            do {
                pathW+=15
                ctx.moveTo(0,pathW)
                pathW+=5
                ctx.lineTo(0,pathW)

                pathW-=5
                ctx.moveTo(root.width,pathW)
                pathW+=5
                ctx.lineTo(root.width,pathW)
            } while(pathW<root.height)

            ctx.closePath()
            ctx.stroke()
        }
    }

    Canvas {
        id:center

        anchors.centerIn: root

        width: 354
        height: 246

        onPaint: {
            var ctx = getContext("2d");
            ctx.lineWidth = 1;
            ctx.strokeStyle = "#9FAAB0"
            ctx.beginPath()

            var pathW=5;
            do {
                ctx.moveTo(pathW,pathW*0.72)
                pathW+=5
                ctx.lineTo(pathW,pathW*0.72)

                pathW-=5
                ctx.moveTo(center.width-pathW,pathW*0.72)
                pathW+=5
                ctx.lineTo(center.width-pathW,pathW*0.72)

                pathW+=10
                ctx.moveTo(pathW,pathW*0.72)
            } while(pathW<=center.width)

            ctx.closePath()
            ctx.stroke()
        }
    }

    Text {
        anchors.centerIn: root
        anchors.verticalCenterOffset: root.height/2+60

        text: "No alarm"

        color: "#9FAAB0"
        font.pixelSize: 60
    }
}
