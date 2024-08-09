import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import BeautyUI 1.0
import "../component"

BWindow {

    id: window
    property string sequence: ""
    title: qsTr("Hotkey")
    width: 250
    height: 250
    fixSize: true
    launchMode: BWindowType.SingleInstance
    onInitArgument:
        (argument)=>{
            window.sequence = argument.sequence
        }
    BText{
        anchors.centerIn: parent
        color: BTheme.primaryColor
        font: BTextStyle.Title
        text: window.sequence
    }
}
