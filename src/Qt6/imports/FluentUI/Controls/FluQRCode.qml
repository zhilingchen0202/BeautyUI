import QtQuick
import QtQuick.Controls
import BeautyUI

Item{
    property alias text: qrcode.text
    property alias color: qrcode.color
    property alias bgColor: qrcode.bgColor
    property int size: 50
    property int margins: 0
    id:control
    width: size
    height: size
    Rectangle{
        color: bgColor
        anchors.fill: parent
    }
    BQrCodeItem{
        id:qrcode
        size:control.size-margins
        anchors.centerIn: parent
    }
}
