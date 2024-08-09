import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import BeautyUI 1.0
import "../component"

BWindow {

    id: window
    title: qsTr("SingleInstance")
    width: 500
    height: 600
    fixSize: true
    launchMode: BWindowType.SingleInstance

    BTextBox{
        anchors{
            top:parent.top
            topMargin:60
            horizontalCenter: parent.horizontalCenter
        }
    }

    BText{
        wrapMode: Text.WrapAnywhere
        anchors{
            left: parent.left
            right: parent.right
            leftMargin: 20
            rightMargin: 20
            verticalCenter: parent.verticalCenter
        }
        text: qsTr("I'm a SingleInstance window, and if I exist, I'll destroy the previous window and create a new one")
    }
}
