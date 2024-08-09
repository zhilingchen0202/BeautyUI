import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import BeautyUI 1.0
import "../component"

BScrollablePage{

    property var colorData: [BColors.Yellow,BColors.Orange,BColors.Red,BColors.Magenta,BColors.Purple,BColors.Blue,BColors.Teal,BColors.Green]
    id: root
    title: qsTr("Theme")

    BFrame{
        Layout.fillWidth: true
        Layout.preferredHeight: 408
        padding: 10

        ColumnLayout{
            spacing:0
            anchors{
                left: parent.left
            }
            BText{
                text: qsTr("Theme colors")
                Layout.topMargin: 10
            }
            RowLayout{
                Layout.topMargin: 5
                Repeater{
                    model: root.colorData
                    delegate:  Rectangle{
                        width: 42
                        height: 42
                        radius: 4
                        color: mouse_item.containsMouse ? Qt.lighter(modelData.normal,1.1) : modelData.normal
                        border.color: modelData.darker
                        BIcon {
                            anchors.centerIn: parent
                            iconSource: BeautyIcons.AcceptMedium
                            iconSize: 15
                            visible: modelData === BTheme.accentColor
                            color: BTheme.dark ? Qt.rgba(0,0,0,1) : Qt.rgba(1,1,1,1)
                        }
                        MouseArea{
                            id:mouse_item
                            anchors.fill: parent
                            hoverEnabled: true
                            onClicked: {
                                BTheme.accentColor = modelData
                            }
                        }
                    }
                }
            }
            Row{
                Layout.topMargin: 10
                spacing: 10
                BText{
                    text: qsTr("Customize the Theme Color")
                    anchors.verticalCenter: parent.verticalCenter
                }
                BColorPicker{
                    id:color_picker
                    current: BTheme.accentColor.normal
                    onAccepted: {
                       BTheme.accentColor = BColors.createAccentColor(current)
                    }
                    BIcon {
                        anchors.centerIn: parent
                        iconSource: BeautyIcons.AcceptMedium
                        iconSize: 15
                        visible: {
                            for(var i =0 ;i< root.colorData.length; i++){
                                if(root.colorData[i] === BTheme.accentColor){
                                    return false
                                }
                            }
                            return true
                        }
                        color: BTheme.dark ? Qt.rgba(0,0,0,1) : Qt.rgba(1,1,1,1)
                    }
                }
            }
            BText{
                text: qsTr("Dark Mode")
                Layout.topMargin: 20
            }
            BToggleSwitch{
                Layout.topMargin: 5
                checked: BTheme.dark
                onClicked: {
                    if(BTheme.dark){
                        BTheme.darkMode = BThemeType.Light
                    }else{
                        BTheme.darkMode = BThemeType.Dark
                    }
                }
            }
            BText{
                text: qsTr("Native Text")
                Layout.topMargin: 20
            }
            BToggleSwitch{
                Layout.topMargin: 5
                checked: BTheme.nativeText
                onClicked: {
                    BTheme.nativeText = !BTheme.nativeText
                }
            }
            BText{
                text: qsTr("Open Animation")
                Layout.topMargin: 20
            }
            BToggleSwitch{
                Layout.topMargin: 5
                checked: BTheme.animationEnabled
                onClicked: {
                    BTheme.animationEnabled = !BTheme.animationEnabled
                }
            }
            BText{
                text: qsTr("Open Blur Window")
                Layout.topMargin: 20
            }
            BToggleSwitch{
                Layout.topMargin: 5
                checked: BTheme.blurBehindWindowEnabled
                onClicked: {
                    BTheme.blurBehindWindowEnabled = !BTheme.blurBehindWindowEnabled
                }
            }
        }
    }
    CodeExpander{
        Layout.fillWidth: true
        Layout.topMargin: -6
        code:'BTheme.accentColor = BColors.Orange

BTheme.dark = true

BTheme.nativeText = true'
    }


}
