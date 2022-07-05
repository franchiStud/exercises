import QtQuick

Rectangle {
    id: root

    anchors.centerIn: parent
    anchors.verticalCenterOffset: 340
    width: 434
    height: buttonHeight

    visible: true
    border.color: "#EC6545"
    border.width: 1
    radius: 32
    color: mouseArea.containsPress
           ? "#EC6545"
           :  "#151B2E"

    Behavior on color {
        ColorAnimation { duration: 250 }
    }

    Text {
        id: txt

        text: "DELETE"

        anchors.centerIn: parent

        color: mouseArea.containsPress
                ? "#151B2E"
                : "#EC6545"
        font.family: "Buenos Aires"
        font.pixelSize: 30
        font.letterSpacing: 1.8

        Behavior on color{
            ColorAnimation { duration: 250 }
        }
     }

     MouseArea {
         id: mouseArea
         anchors.fill: parent
         onClicked: {
             for(var a=0;a<alarmListObj.isSelected.length;a++){
                 var now=alarmListObj.isSelected[a].date;

                 for(var e=0;e<everyDayAlarms.count;e++){
                     var alarmE = everyDayAlarms.get(e).date
                     if(now.getMinutes()===alarmE.getMinutes()
                      &&now.getHours()  ===alarmE.getHours()
                      &&alarmListObj.isSelected[a].everyDay)
                         everyDayAlarms.remove(e--, 1);
                 }


                 for(var i=0;i<dateAlarms.count;i++){
                     var alarmD = dateAlarms.get(i).date
                     if(now.getMinutes() ===alarmD.getMinutes()
                      &&now.getHours()   ===alarmD.getHours()
                      &&now.getDate()    ===alarmD.getDate()
                      &&now.getMonth()   ===alarmD.getMonth()
                      &&now.getFullYear()===alarmD.getFullYear()
                      &&!alarmListObj.isSelected[a].everyDay)
                         dateAlarms.remove(i--, 1)
                 }
             }

             isThereAlarm=dateAlarms.count>0 ||
                               everyDayAlarms.count>0

             alarmListObj.howManySelected=0
         }
     }
}
