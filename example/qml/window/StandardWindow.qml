import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import BeautyUI 1.0
import "../component"

BWindow {

    id:window
    title:"Standard"
    width: 500
    height: 600
    fixSize: true
    launchMode: BWindowType.Standard

    BMenuBar {
        BMenu {
            title: qsTr("File")
            Action { text: qsTr("New...") }
            Action { text: qsTr("Open...") }
            Action { text: qsTr("Save") }
            Action { text: qsTr("Save As...") }
            BMenuSeparator { }
            Action { text: qsTr("Quit") }
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

    BText{
        anchors.centerIn: parent
        text: qsTr("I'm a Standard mode window, and every time I create a new window")
    }

}
