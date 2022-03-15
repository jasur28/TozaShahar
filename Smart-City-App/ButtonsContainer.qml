import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.12
import Qt.labs.settings 1.0

    Button  {
        id: buttonId
        property alias buttonText: textId.text
        Text {
            id: textId
            text: qsTr("textName")
            //Material.foreground: "white"
            color: "white"
            anchors.centerIn: parent
        }



        onClicked: {

            stack.push("CameraTakePhoto.qml")
            Message_Dialog

        }


        background: Rectangle {
            color: "#41cd52"
            implicitWidth: 150
            implicitHeight: 150
            border.color: control.down ? "#17a81a" : "#21be2b"
            border.width: 1
            radius: 14
        }
    }

//Item {
//    GridLayout
//    {
//        id: gridLayoutID
//        columns: 2
//        anchors.centerIn: parent
//        columnSpacing: 25
//        Button  {
//            id: buttonGass


//            Layout.fillWidth: true
//            Layout.fillHeight: true
//            background: Rectangle {
//                color: "#41cd52"
//                implicitWidth: 150
//                implicitHeight: 150
//                //opacity: enabled ? 1 : 0.3
//                border.color: control.down ? "#17a81a" : "#21be2b"
//                border.width: 1
//                radius: 14
//            }
//        }
//        Button  {
//            id: buttonPolution

//            Layout.fillWidth: true
//            Layout.fillHeight: true
//            background: Rectangle {
//                color: "#41cd52"
//                implicitWidth: 150
//                implicitHeight: 150
//                //opacity: enabled ? 1 : 0.3
//                border.color: control.down ? "#17a81a" : "#21be2b"
//                border.width: 1
//                radius: 14
//            }
//        }
//        Button  {
//            id: buttonRoads

//            Layout.fillWidth: true
//            Layout.fillHeight: true
//            background: Rectangle {
//                color: "#41cd52"
//                implicitWidth: 150
//                implicitHeight: 150
//                //opacity: enabled ? 1 : 0.3
//                border.color: control.down ? "#17a81a" : "#21be2b"
//                border.width: 1
//                radius: 14
//            }
//        }
//        Button  {
//            id: buttonElectrycity

//            Layout.fillWidth: true
//            Layout.fillHeight: true
//            background: Rectangle {
//                color: "#41cd52"
//                implicitWidth: 150
//                implicitHeight: 150
//                //opacity: enabled ? 1 : 0.3
//                border.color: control.down ? "#17a81a" : "#21be2b"
//                border.width: 1
//                radius: 14
//            }
//        }
//    }
//}

