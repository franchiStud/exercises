import QtQuick

Item {
   id: root
   property string txt
   Item{ //Label titolo
       x: 240
       y: 58
       Text{
           anchors.centerIn: parent
           id: head
           text: root.txt
           font.pixelSize: 36
           color: "#9FAAB0"
           visible: true
       }
   }

   Rectangle{ //linea (separa label "DeveClock" e label data)
       x: 40
       y: 116
       width: 400
       height: 1
       color: "#9FAAB0"
       visible: true
   }
}
