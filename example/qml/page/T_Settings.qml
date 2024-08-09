import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import BeautyUI 1.0
import "../component"
import "../global"

BScrollablePage{

    title: qsTr("Settings")

    BEvent{
        name: "checkUpdateFinish"
        onTriggered: {
            btn_checkupdate.loading = false
        }
    }

    BFrame{
        Layout.fillWidth: true
        Layout.topMargin: 20
        Layout.preferredHeight: 60
        padding: 10
        Row{
            spacing: 20
            anchors.verticalCenter: parent.verticalCenter
            BText{
                text: "%1 v%2".arg(qsTr("Current Version")).arg(AppInfo.version)
                font: BTextStyle.Body
                anchors.verticalCenter: parent.verticalCenter
            }
            BLoadingButton{
                id: btn_checkupdate
                text: qsTr("Check for Updates")
                anchors.verticalCenter: parent.verticalCenter
                onClicked: {
                    loading = true
                    BEventBus.post("checkUpdate")
                }
            }
        }
    }

    BFrame{
        Layout.fillWidth: true
        Layout.topMargin: 20
        height: 50
        padding: 10
        BCheckBox{
            text: qsTr("Use System AppBar")
            checked: BApp.useSystemAppBar
            anchors.verticalCenter: parent.verticalCenter
            onClicked: {
                BApp.useSystemAppBar = !BApp.useSystemAppBar
                dialog_restart.open()
            }
        }
    }

    BFrame{
        Layout.fillWidth: true
        Layout.topMargin: 20
        height: 50
        padding: 10
        BCheckBox{
            text:qsTr("Fits AppBar Windows")
            checked: window.fitsAppBarWindows
            anchors.verticalCenter: parent.verticalCenter
            onClicked: {
                window.fitsAppBarWindows = !window.fitsAppBarWindows
            }
        }
    }

    BContentDialog{
        id: dialog_restart
        title: qsTr("Friendly Reminder")
        message: qsTr("This action requires a restart of the program to take effect, is it restarted?")
        buttonFlags: BContentDialogType.NegativeButton | BContentDialogType.PositiveButton
        negativeText: qsTr("Cancel")
        positiveText: qsTr("OK")
        onPositiveClicked: {
            BRouter.exit(931)
        }
    }

    BFrame{
        Layout.fillWidth: true
        Layout.topMargin: 20
        height: 128
        padding: 10

        ColumnLayout{
            spacing: 5
            anchors{
                top: parent.top
                left: parent.left
            }
            BText{
                text: qsTr("Dark Mode")
                font: BTextStyle.BodyStrong
                Layout.bottomMargin: 4
            }
            Repeater{
                model: [{title:qsTr("System"),mode:BThemeType.System},{title:qsTr("Light"),mode:BThemeType.Light},{title:qsTr("Dark"),mode:BThemeType.Dark}]
                delegate: BRadioButton{
                    checked : BTheme.darkMode === modelData.mode
                    text:modelData.title
                    clickListener:function(){
                        BTheme.darkMode = modelData.mode
                    }
                }
            }
        }
    }

    BFrame{
        Layout.fillWidth: true
        Layout.topMargin: 20
        height: 160
        padding: 10

        ColumnLayout{
            spacing: 5
            anchors{
                top: parent.top
                left: parent.left
            }
            BText{
                text:qsTr("Navigation View Display Mode")
                font: BTextStyle.BodyStrong
                Layout.bottomMargin: 4
            }
            Repeater{
                model: [{title:qsTr("Open"),mode:BNavigationViewType.Open},{title:qsTr("Compact"),mode:BNavigationViewType.Compact},{title:qsTr("Minimal"),mode:BNavigationViewType.Minimal},{title:qsTr("Auto"),mode:BNavigationViewType.Auto}]
                delegate: BRadioButton{
                    text: modelData.title
                    checked: GlobalModel.displayMode === modelData.mode
                    clickListener:function(){
                        GlobalModel.displayMode = modelData.mode
                    }
                }
            }
        }
    }

    ListModel{
        id:model_language
        ListElement{
            name:"en"
        }
        ListElement{
            name:"zh"
        }
    }

    BFrame{
        Layout.fillWidth: true
        Layout.topMargin: 20
        height: 80
        padding: 10

        ColumnLayout{
            spacing: 10
            anchors{
                top: parent.top
                left: parent.left
            }
            BText{
                text:qsTr("Language")
                font: BTextStyle.BodyStrong
                Layout.bottomMargin: 4
            }
            Flow{
                spacing: 5
                Repeater{
                    model: TranslateHelper.languages
                    delegate: BRadioButton{
                        checked: TranslateHelper.current === modelData
                        text:modelData
                        clickListener:function(){
                            TranslateHelper.current = modelData
                            dialog_restart.open()
                        }
                    }
                }
            }
        }
    }
}
