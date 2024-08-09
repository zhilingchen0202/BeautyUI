import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import BeautyUI 1.0
import "../component"

BWindow {

    id: window
    title: qsTr("SingleTask")
    width: 500
    height: 600
    fixSize: true
    launchMode: BWindowType.SingleTask

    BText{
        anchors.centerIn: parent
        text: qsTr("I'm a SingleTask mode window, and if I exist, I activate the window")
    }

}
