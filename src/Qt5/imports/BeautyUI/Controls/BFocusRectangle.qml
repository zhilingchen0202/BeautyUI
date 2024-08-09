import QtQuick 2.15
import QtQuick.Controls 2.15
import BeautyUI 1.0

Item {
    property int radius: 4
    id:control
    anchors.fill: parent
    Rectangle{
        width: control.width
        height: control.height
        anchors.centerIn: parent
        color: "#00000000"
        border.width: 2
        radius: control.radius
        border.color: BTheme.dark ? Qt.rgba(1,1,1,1) : Qt.rgba(0,0,0,1)
        z: 65535
    }
}
