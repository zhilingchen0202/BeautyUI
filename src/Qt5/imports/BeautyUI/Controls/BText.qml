import QtQuick 2.15
import QtQuick.Controls 2.15
import BeautyUI 1.0

Text {
    property color textColor: BTheme.fontPrimaryColor
    id:text
    color: textColor
    renderType: BTheme.nativeText ? Text.NativeRendering : Text.QtRendering
    font: BTextStyle.Body
}
