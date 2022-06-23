import QtQuick

Item {
    id: root
    property var everyDayAlarms: ListModel{}
    property var dateAlarms: ListModel{}
    property var isSelected: []
    property real howManySelected: 0
    property var deleteButton: DeleteButton{ x: 23; y: 706 }

    Text{
        x: 38
        y: 135
        text: everyDayAlarms.count>0 ? "Everyday" : ""
        font.pixelSize: 20
        color: "#FCB647"
    }

    ListView{
        id: everyDayView
        model: everyDayAlarms
        x: 29
        y: 185
        width: 180
        height: 200
        delegate: Rectangle{
            id: thisAlarmE
            width: 400
            height: 88
            color: "#151B2E"
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
                            isSelected[root.howManySelected++]={"hours": hours, "minutes": minutes}
                        else{
                            var app=[], e=0;
                            for(var i=0;i<root.howManySelected;i++)
                                if(isSelected[i]!=={"hours": hours, "minutes": minutes})
                                    app[e++]=isSelected[i]
                            isSelected=app
                            howManySelected--;
                        }
                        parent.state= (parent.state==="selected")? "disabled" : "selected"
                    }
                }
            }
            Text {
                text: hours
                font.pixelSize: 20
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

    Text{
        x: 38
        y: 135+(everyDayAlarms.count>0 ? everyDayAlarms.count*88+100 : 0)
        text: dateAlarms>0 ? "Others" : ""
        font.pixelSize: 20
        color: "#FCB647"
    }
    ListView{
        id: elenco
        model: dateAlarms
        x: 29
        y: 185+(everyDayAlarms.count>0 ? everyDayAlarms.count*88+150 : 0)
        width: 180
        height: 200
        delegate: Rectangle{
            width: 400
            height: 88
            color: "#151B2E"
            Row{
                spacing: 10
                Text {
                    text: hours
                    font.pixelSize: 20
                }
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
}
