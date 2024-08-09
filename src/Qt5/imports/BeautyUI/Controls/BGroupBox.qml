import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
import QtQuick.Controls.impl 2.15
import QtQuick.Templates 2.15 as T
import BeautyUI 1.0

T.GroupBox {
    id: control
    property int borderWidth : 1
    property color borderColor : BTheme.dividerColor
    property color color: {
        if(Window.active){
            return BTheme.frameActiveColor
        }
        return BTheme.frameColor
    }
    property int radius: 4
    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            contentWidth + leftPadding + rightPadding,
                            implicitLabelWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             contentHeight + topPadding + bottomPadding)
    spacing: 6
    padding: 12
    font: BTextStyle.Body
    topPadding: padding + (implicitLabelWidth > 0 ? implicitLabelHeight + spacing : 0)
    label: BText {
        width: control.availableWidth
        text: control.title
        font: BTextStyle.BodyStrong
        elide: Text.ElideRight
        verticalAlignment: Text.AlignVCenter
    }
    background: Rectangle {
        y: control.topPadding - control.bottomPadding
        width: parent.width
        height: parent.height - control.topPadding + control.bottomPadding
        radius: control.radius
        border.color: control.borderColor
        border.width: control.borderWidth
        color: control.color
    }
}
