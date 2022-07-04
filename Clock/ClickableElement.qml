import QtQuick

MouseArea {
    property bool doPush: true
    property string nextView
    property var nextStackView
    anchors.fill: parent

    onClicked: {
        if(doPush){
            view=nextView
            stackView.push(nextStackView)
        } else {
            stackView.pop()
            view= (view!=="Alarm set date") ? "DeveClock" : "Alarm"
        }
    }
}
