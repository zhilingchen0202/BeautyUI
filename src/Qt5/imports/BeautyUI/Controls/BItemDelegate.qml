import QtQuick 2.15
import QtQuick.Templates 2.15 as T
import BeautyUI 1.0

T.ItemDelegate {
    id: control
    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding,
                             implicitIndicatorHeight + topPadding + bottomPadding)
    padding: 0
    verticalPadding: 8
    horizontalPadding: 10
    icon.color: control.palette.text
    contentItem:BText {
        text: control.text
        font: control.font
        color:{
            if(control.down){
                return BTheme.dark ? BColors.Grey80 : BColors.Grey120
            }
            return BTheme.dark ? BColors.White : BColors.Grey220
        }
    }
    background: Rectangle {
        implicitWidth: 100
        implicitHeight: 30
        color:{
            if(BTheme.dark){
                return Qt.rgba(1,1,1,0.05)
            }else{
                return Qt.rgba(0,0,0,0.05)
            }
        }
        visible: control.down || control.highlighted || control.visualFocus
    }
}
