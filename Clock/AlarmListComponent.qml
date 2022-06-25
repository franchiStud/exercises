import QtQuick


Component {
    id: alarmListComponent

    Rectangle {
        id: thisAlarmE

        property real lineHeight: 88

        width: 424
        height: lineHeight

        color: "#151B2E"

        Rectangle {
            id: onOffButton

            x: parent.width-124
            anchors.verticalCenter: parent.verticalCenter
            width: 112
            height: 60          
            radius: width/14

            color: isActive ? "#0f494f" : "#313848"

            Behavior on color {
                ColorAnimation { duration: 250 }
            }

            MouseArea {
                anchors.fill:parent
                onClicked: isActive=!isActive
            }

        }

        Image {
            id: onOffImage

            source: isActive ? "/assets/switch-on-selected"
                             : "/assets/switch-off-selected"

            x: isActive ? onOffButton.x + 4 : onOffButton.x + 54
            anchors.verticalCenter: parent.verticalCenter

            Behavior on x {
                NumberAnimation { duration: 250 }
            }
        }

        Image {
            id: img

            property bool disable: true

            x: 15
            y: 33

            source: disable ? "/assets/check_disabled.svg"
                            : "/assets/check_selected.svg"

            MouseArea {
                anchors.fill: parent

                onClicked: {
                    var thisAlarm={"hours": hours, "minutes": minutes,
                        "day": day, "month": month, "year": year}

                    if(parent.disable===true) {
                        isSelected[root.howManySelected++]=thisAlarm
                    } else {
                        var app=[], e=0;

                        for(var i=0;i<root.howManySelected;i++)
                            if(isSelected[i]!==thisAlarm)
                                app[e++]=isSelected[i]
                        isSelected=app
                        howManySelected--;
                    }
                    parent.disable= !parent.disable
                }
            }
        }

        Text {// hourTxt
            id: hourTxt

            text: hours+":"+(minutes<10 ? "00" : minutes)

            x: 82
            y: day===0 ? 20 : 35

            font.pixelSize: 40
            color: "#9FAAB0"
        }

        Text {// dateTxt
            text: day===0 ? "" : day+"/"+month+"/"+year

            anchors.horizontalCenter: hourTxt.horizontalCenter
            y: 14

            font.pixelSize: 18
            color: "#9FAAB0"
        }

        Rectangle {

            width: parent.width
            height: 1

            color: "#1B2F46"
        }

        Rectangle {
            y: parent.height-1

            width: parent.width
            height: 1

            color: "#1B2F46"
        }
    }
}
