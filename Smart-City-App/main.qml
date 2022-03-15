import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Controls.Universal 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import Qt.labs.settings 1.0
import QtQuick.Dialogs 1.2
import QtQuick.Controls.Styles 1.4
import POST_REQ 1.0



ApplicationWindow {
    id: appWindowId
    visible: true
    width: 360
    height: 520
    title: qsTr("Smart City")

    color: "beige"



    StackView {
        id: stackView
        anchors.fill: parent



        Flickable{
            width: parent.width
            height: parent.height
            contentHeight: gridLayoutID.implicitHeight + 100
            GridLayout
            {
                id: gridLayoutID
                columns: 2
                anchors.centerIn: parent
                columnSpacing: 100
                ButtonsContainer{
                    id: buttonGass
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    buttonText: "Gas"
                    onClicked: {

                        stackView.push("CameraTakePhoto.qml")
                        messageDialog.open()
                    }



                }
                ButtonsContainer{
                    id: buttonPolution
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    buttonText: "Road"
                    onClicked: {
                        stackView.push("CameraTakePhoto.qml")
                        messageDialog.open()
                    }
                }
                ButtonsContainer{
                    id: buttonElect
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    buttonText: "Polution"
                    onClicked: {

                        stackView.push("CameraTakePhoto.qml")
                        messageDialog.open()
                    }
                }
                ButtonsContainer{
                    id: buttonRoad
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    buttonText: "Electrycity"
                    onClicked: {
                        stackView.push("CameraTakePhoto.qml")
                        messageDialog.open()
                    }
                }
            }

        }

    }





    header: ToolBar{

        Material.foreground: "white"
        RowLayout {
            anchors.fill: parent

            ToolButton {
                //text: qsTr("‹")
                icon.source:  "icons/icons/gallery/20x20/drawer.png"
                onClicked: drawerId.open()
            }
            Label {
                id: titleLabel
                text: "Smart City"
                font.pixelSize: 20
                elide: Label.ElideRight
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
                Layout.fillWidth: true
            }
        }
    }

    Drawer{
        id: drawerId

        width: Math.min(appWindowId.width, appWindowId.height)/3*2
        height: parent.height

        ListView{
            id: listViewId

            focus: true
            currentIndex: -1
            anchors.fill: parent

            delegate: ItemDelegate {
                width: parent.width
                text: model.text
                highlighted: ListView.isCurrentItem
                onClicked: {
                    //listViewId.currentIndex =index
                    //drawerId.close()
                    model.triggered()
                }
            }

            model: ListModel {
                ListElement {
                    text: qsTr("Open...")
                    triggered: function(){ fileOpenDialog.open(); }
                }
                ListElement {
                    text: qsTr("About...")
                    triggered: function(){ aboutDialog.open(); }
                }
            }
        }
    }

    FileDialog {
        id: fileOpenDialog
        title: "Select an image file"
        folder: shortcuts.documents
        nameFilters: [
            "Image files (*.png *.jpeg *.jpg)",
        ]
        onAccepted: {
            image.source = fileOpenDialog.fileUrl
        }
    }

    Dialog {
        id: aboutDialog
        title: qsTr("About")
        Label {
            anchors.fill: parent
            text: qsTr("QML Image Viewer\nA part of the QmlBook\nhttp://qmlbook.org")
            horizontalAlignment: Text.AlignHCenter
        }

        standardButtons: StandardButton.Ok
    }


    MessageDialog {
        id: messageDialog
        title: "May I have your attention please"
        text: "Turn on GPS please before using app"
        standardButtons: StandardButton.Ok | StandardButton.Close
        onAccepted: {
            console.log("And of course you could only agree.")

        }
        onRejected: {
            console.log("You rejected the dialog")
        }


    }


}

//    Settings {
//        id: settings
//        property string style: "Default"
//    }

/*
Shortcut {
    sequences: ["Esc", "Back"]
    enabled: stackView.depth > 1
    onActivated: navigateBackAction.trigger()
}

Action {
    id: navigateBackAction
    icon.name: stackView.depth > 1 ? "back" : "drawer"
    onTriggered: {
        if (stackView.depth > 1) {
            stackView.pop()
            listView.currentIndex = -1
        } else {
            drawer.open()
        }
    }
}

Shortcut {
    sequence: "Menu"
    onActivated: optionsMenuAction.trigger()
}

Action {
    id: optionsMenuAction
    icon.name: "menu"
    onTriggered: optionsMenu.open()
}
*/
