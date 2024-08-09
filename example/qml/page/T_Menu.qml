import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import BeautyUI 1.0
import "../component"

BScrollablePage{

    title: qsTr("Menu")

    BMenu {
        id:menu
        title: qsTr("File")
        Action { text: qsTr("New...")}
        Action { text: qsTr("Open...") }
        Action { text: qsTr("Save") }
        BMenuSeparator { }
        BMenuItem{
            text: qsTr("Quit")
            onTriggered: {
                showError("Quit")
            }
        }
        BMenuItem{
            text: qsTr("Search")
            iconSource: BeautyIcons.Zoom
            iconSpacing: 3
            onTriggered: {
                showError(qsTr("Search"))
            }
        }
        Action {
            text: qsTr("Disable")
            enabled:false
            onTriggered: {
                showError(qsTr("Disable"))
            }
        }
        BMenuSeparator { }
        Action { text: qsTr("Check");checkable: true;checked: true}
        BMenu{
            title: qsTr("Save As...")
            Action { text: qsTr("Doc") }
            Action { text: qsTr("PDF") }
        }
    }


    BFrame{
        Layout.fillWidth: true
        Layout.preferredHeight: 100
        padding: 10
        Column{
            id: layout_column
            spacing: 15
            anchors{
                verticalCenter: parent.verticalCenter
                left:parent.left
            }

            BText{
                text: qsTr("Menu")
            }

            BButton{
                text: qsTr("Show Menu Popup")
                Layout.topMargin: 20
                onClicked:{
                    menu.popup()
                }
            }


        }
    }

    CodeExpander{
        Layout.fillWidth: true
        Layout.topMargin: -6
        code:'BMenu{
    id:menu
    BMenuItem:{
        text:"删除"
        onClicked: {
            showError("删除")
        }
    }
    BMenuItem:{
        text:"修改"
        onClicked: {
            showInfo("修改")
        }
    }
}
menu.popup()
'
    }


    BFrame{
        Layout.fillWidth: true
        Layout.preferredHeight: 100
        padding: 10
        Layout.topMargin: 20
        Column{
            spacing: 15
            anchors{
                verticalCenter: parent.verticalCenter
                left:parent.left
            }

            BText{
                text: qsTr("MenuBar")
            }

            BMenuBar {
                id:menu_bar
                BMenu {
                    title: qsTr("File")
                    Action { text: qsTr("New...") }
                    Action { text: qsTr("Open...") }
                    Action { text: qsTr("Save") }
                    BMenuSeparator { }
                    Action { text: qsTr("Quit") }
                    Action {
                        text: qsTr("Disable")
                        enabled:false
                    }
                    BMenu{
                        title: qsTr("Save As...")
                        Action { text: qsTr("Doc") }
                        Action { text: qsTr("PDF") }
                    }
                }
                BMenu {
                    title: qsTr("Edit")
                    Action { text: qsTr("Cut") }
                    Action { text: qsTr("Copy") }
                    Action { text: qsTr("Paste") }
                }
                BMenu {
                    title: qsTr("Help")
                    Action { text: qsTr("About") }
                }
            }

        }
    }

    CodeExpander{
        Layout.fillWidth: true
        Layout.topMargin: -6
        code:'BMenuBar{
    id:menu
    BMenu:{
        title:"File"
        Action { text: qsTr("New...") }
    }
    BMenu:{
        title:"Edit"
        Action { text: qsTr("Cut") }
        Action { text: qsTr("Copy") }
        Action { text: qsTr("Paste") }
    }
}
menu.popup()
'
    }
}
