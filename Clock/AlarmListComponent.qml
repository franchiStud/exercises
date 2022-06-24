import QtQuick


Component {
    id: alarmListComponent
    Rectangle {

        id: thisAlarmE
        width: 400
        height: 88
        color: "#151B2E"
        Rectangle{
            id: onOffButton
            x: 302
            y: 14
            width: 112
            height: 60
            radius: 8
            state: isActive ? "on" : "off"
            states: [
                State {
                    name: "on"
                    PropertyChanges {
                        target: onOffButton
                        color: "#0f494f"
                    }
                    PropertyChanges {
                        target: onOffImage
                        source: "/assets/switch-on-selected"
                        x: 306
                    }
                },
                State {
                    name: "off"
                    PropertyChanges {
                        target: onOffButton
                        color: "#313848"
                    }
                    PropertyChanges {
                        target: onOffImage
                        source: "/assets/switch-off-selected"
                        x: 358
                    }
                }
            ]
            Behavior on color{
                ColorAnimation{ duration: 250 }
            }
            MouseArea{
                anchors.fill:parent
                onClicked: isActive=!isActive
            }
        }
        Image {
            id: onOffImage
            y: 18
            state: isActive ? "on" : "off"
            Behavior on x{
                NumberAnimation{ duration: 250 }
            }
        }
        Image {
            id: img
            x: 15
            y: 33
            state: "disabled"
            states:[
                State {
                    name: "disabled"
                    PropertyChanges {
                        target: img
                        source: "/assets/check_disabled.svg"
                    }
                },
                State {
                    name: "selected"
                    PropertyChanges {
                        target: img
                        source: "/assets/check_selected.svg"
                    }
                }
            ]
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    if(parent.state==="disabled")
                        isSelected[root.howManySelected++]={"hours": hours,
                            "minutes": minutes, "day": day, "month": month, "year": year}
                    else{
                        var app=[], e=0;
                        for(var i=0;i<root.howManySelected;i++)
                            if(isSelected[i]!=={"hours": hours,
                                        "minutes": minutes, "day": day0,
                                        "month": month, "year": year})
                                app[e++]=isSelected[i]
                        isSelected=app
                        howManySelected--;
                    }
                    parent.state= (parent.state==="selected")? "disabled" : "selected"
                }
            }
        }
        Text{
            x: 82
            y: 14
            text: day===0 ? "" : day+"/"+month+"/"+year
            font.pixelSize: 18
            color: "#9FAAB0"
        }

        Text {
            text: hours+":"+(minutes<10 ? "00" : minutes)
            font.pixelSize: 40
            x: 82
            y: day===0 ? 20 : 35
            color: "#9FAAB0"
        }
        Rectangle{
            y: 0
            width: 424
            height: 1
            color: "#1B2F46"
        }
        Rectangle{
            y: 87
            width: 424
            height: 1
            color: "#1B2F46"
        }
    }
}
