import QtQuick

Item {
    id: root

    property var newDate: {
        var d=new Date()
        return [d.getDate(), d.getMonth()+1, d.getFullYear(), d.getDay()]
    }// [0: day] [1: month] [2: year] [3: weekday]

    Rectangle {
        x: 28
        y: 140

        width: 190
        height: 290
        radius:30

        color: "#1B2F46"

        Text{
            id: day

            text: newDate[0]

            anchors.horizontalCenter: parent.horizontalCenter
            y: 104
            width: parent.width

            color: "#FCB647"
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 120
        }
        Text{
            id: weekDay

            text: {
                switch(root.newDate[3]){
                    case 0: return "Sun"
                    case 1: return "Mon"
                    case 2: return "Tue"
                    case 3: return "Wed"
                    case 4: return "Thu"
                    case 5: return "Fri"
                    case 6: return "Sat"
                }
            }

            anchors.horizontalCenter: parent.horizontalCenter
            y: 45
            width: parent.width

            color: "#9FAAB0"
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 50
        }
        Text{
            id: restOfDate

            text: "/"+root.newDate[1]+"/"+root.newDate[2]

            x: parent.width+18
            anchors.verticalCenter: day.verticalCenter
            width: parent.width


            color: "#9FAAB0"
            font.pixelSize: 40
            font.letterSpacing: 2
        }

        AlarmSetDateArrow{
            direction: true

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    chDate(parent.direction)
                    refreshDate()
                    arrowTimer.thenChange=parent
                    arrowTimer.running=true
                }
            }
        }

        AlarmSetDateArrow{
            direction: false

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    chDate(parent.direction)
                    refreshDate()
                    arrowTimer.thenChange=parent
                    arrowTimer.running=true
                }
            }
        }
    }

    Timer{
        id: arrowTimer

        property var thenChange

        interval: 150; running: false; repeat: false
        onTriggered: thenChange.state= "active"
    }

    function chDate(direction){//true: upArrow, false: downArrow
        if(direction){
            root.newDate[0]++

            if((root.newDate[0] > 31) ||//jan, march, may, july, aug, oct, dec
                    (root.newDate[0] > 30 &&
                                        (root.newDate[1] === 4 ||//apr
                                         root.newDate[1] === 6 ||//june
                                         root.newDate[1] === 9 ||//sept
                                         root.newDate[1] === 11 )) ||//nov
                    (root.newDate[0] > 28 &&//non-leap year feb
                                         root.newDate[1] === 2 &&
                                        (root.newDate[2]%4 !== 0 ||
                                         root.newDate[2]%100 === 0)) ||
                    (root.newDate[0] > 29&&//leap year feb
                                        root.newDate[1] === 2 &&
                                       (root.newDate[2]%4 === 0 &&
                                        root.newDate[2]%100 !== 0)))
            {
                root.newDate[1]++
                root.newDate[0]=1
            }

            if(root.newDate[1] > 12){
                root.newDate[2]++
                root.newDate[1]=1
            }

            root.newDate[3]=(root.newDate[3]+1)%7

        } else {
            root.newDate[0]--

            if(root.newDate[0] < 1){

                root.newDate[1]--

                if(root.newDate[1] === 0){
                    root.newDate[1]=12
                    root.newDate[2]--
                }
                if(root.newDate[1] === 2 &&//leap year feb
                        root.newDate[2]%4 === 0 &&
                        root.newDate[2]%100 !== 0)
                    root.newDate[0]=29

                else if(root.newDate === 2)//non-leap year feb
                    root.newDate[0]=28

                else if(root.newDate[1] === 4 ||//apr
                        root.newDate[1] === 6 ||//june
                        root.newDate[1] === 9 ||//sept
                        root.newDate[1] === 11)//nov
                    root.newDate[0]=30

                else//jan, march, may, july, aug, oct, dec
                    root.newDate[0]=31
            }


            root.newDate[3]--

            if(root.newDate[3] < 0)
                root.newDate[3]=6
        }
    }

    function refreshDate(){
        day.text=root.newDate[0]

        restOfDate.text="/"+root.newDate[1]+"/"+root.newDate[2]

        switch(root.newDate[3]){
            case 0: weekDay.text="Sun"; break
            case 1: weekDay.text="Mon"; break
            case 2: weekDay.text="Tue"; break
            case 3: weekDay.text="Wed"; break
            case 4: weekDay.text="Thu"; break
            case 5: weekDay.text="Fri"; break
            case 6: weekDay.text="Sat"; break
        }
    }
}
