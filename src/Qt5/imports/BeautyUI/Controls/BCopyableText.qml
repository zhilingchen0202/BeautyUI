import QtQuick 2.15
import QtQuick.Controls 2.15
import BeautyUI 1.0

TextEdit {
    property color textColor: BTheme.dark ? BColors.White : BColors.Grey220
    id:control
    color: textColor
    readOnly: true
    activeFocusOnTab: false
    activeFocusOnPress: false
    renderType: BTheme.nativeText ? Text.NativeRendering : Text.QtRendering
    padding: 0
    leftPadding: 0
    rightPadding: 0
    topPadding: 0
    selectByMouse: true
    selectedTextColor: color
    bottomPadding: 0
    selectionColor: BTools.withOpacity(BTheme.primaryColor,0.5)
    font:BTextStyle.Body
    onSelectedTextChanged: {
        control.forceActiveFocus()
    }
    MouseArea{
        anchors.fill: parent
        cursorShape: Qt.IBeamCursor
        acceptedButtons: Qt.RightButton
        onClicked: control.echoMode !== TextInput.Password && menu_loader.popup()
    }
    BLoader{
        id: menu_loader
        function popup(){
            sourceComponent = menu
        }
    }
    Component{
        id:menu
        BTextBoxMenu{
            inputItem: control
            Component.onCompleted: {
                popup()
            }
            onClosed: {
                menu_loader.sourceComponent = undefined
            }
        }
    }
}
