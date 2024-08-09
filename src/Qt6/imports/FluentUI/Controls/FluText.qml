import QtQuick
import QtQuick.Controls
import BeautyUI

Text {
    property color textColor: BTheme.fontPrimaryColor
    id:text
    color: textColor
    renderType: BTheme.nativeText ? Text.NativeRendering : Text.QtRendering
    font: BTextStyle.Body
}
