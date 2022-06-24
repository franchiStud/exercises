import QtQuick

Item{ //Label data

    Text{
        id: date
        text: getDate();

        anchors.centerIn: parent

        font.pixelSize: 24
        color: "#FCB647"
    }

    Timer{ //la data si aggiorna ogni 0.5 secondi
        interval: 500; running: true; repeat: true;
        onTriggered: { date.text=getDate() }
    }

    function getDate(){ //calcola la data di oggi
        var s=""

        switch(new Date().getMonth()){
            case 0: s+="Jenuary "; break
            case 1: s+="February "; break
            case 2: s+="March" ; break
            case 3: s+="April "; break
            case 4: s+="May "; break
            case 5: s+="June "; break
            case 6: s+="July "; break
            case 7: s+="August "; break
            case 8: s+="September "; break
            case 9: s+="October "; break
            case 10: s+="November "; break
            case 11: s+="December "; break
        }
        s+=new Date().getDate()
        switch(new Date().getDay()){
            case 1: s+=", Monday"; break
            case 2: s+=", Tuesday"; break
            case 3: s+=", Wednesday"; break
            case 4: s+=", Thursday"; break
            case 5: s+=", Friday"; break
            case 6: s+=", Saturday"; break
            case 0: s+=", Sunday"; break
        }
        return s;
    }
}
