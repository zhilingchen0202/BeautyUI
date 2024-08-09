import QtQuick
import QtQuick.Controls
import BeautyUI

SplitView {
    property color handleColor : BTheme.dark ? Qt.rgba(159/255,159/255,159/255,1) : Qt.rgba(138/255,138/255,138/255,1)
    id:control
    QtObject{
        id:d
        property bool isVertical: control.orientation === Qt.Vertical
    }
    handle: Rectangle {
        implicitWidth: d.isVertical ? control.width : 12
        implicitHeight: d.isVertical ? 12 : control.height
        clip: true
        color: {
            if(SplitHandle.pressed){
                return BTheme.itemPressColor
            }
            return SplitHandle.hovered ? BTheme.itemHoverColor : BTheme.itemNormalColor
        }
        Rectangle{
            width: d.isVertical ? 26 : 4
            height: d.isVertical ? 4 : 26
            anchors.centerIn: parent
            color: control.handleColor
            radius: 2
        }
    }
}
