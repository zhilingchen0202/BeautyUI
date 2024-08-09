import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import BeautyUI 1.0
import "../component"

BScrollablePage{

    title: qsTr("Buttons")

    BText{
        text: qsTr("Support the Tab key to switch focus, and the Space key to perform click events")
    }

    BFrame{
        Layout.fillWidth: true
        Layout.preferredHeight: 68
        Layout.topMargin: 10
        padding: 10

        BTextButton{
            disabled: text_button_switch.checked
            text: qsTr("Text Button")
            onClicked: {
                showInfo("点击Text Button")
            }
            anchors{
                verticalCenter: parent.verticalCenter
                left: parent.left
            }
        }
        BToggleSwitch{
            id: text_button_switch
            anchors{
                right: parent.right
                verticalCenter: parent.verticalCenter
            }
            text: qsTr("Disabled")
        }
    }
    CodeExpander{
        Layout.fillWidth: true
        Layout.topMargin: -6
        code:'BTextButton{
    text:"Text Button"
    onClicked: {

    }
}'
    }

    BFrame{
        Layout.fillWidth: true
        Layout.preferredHeight: 68
        padding: 10
        Layout.topMargin: 20

        BButton{
            disabled: button_switch.checked
            text: qsTr("Standard Button")
            onClicked: {
                showInfo(qsTr("Click StandardButton"))
            }
            anchors{
                verticalCenter: parent.verticalCenter
                left: parent.left
            }
        }
        BToggleSwitch{
            id: button_switch
            anchors{
                right: parent.right
                verticalCenter: parent.verticalCenter
            }
            text: qsTr("Disabled")
        }
    }
    CodeExpander{
        Layout.fillWidth: true
        Layout.topMargin: -6
        code:'BButton{
    text:"Standard Button"
    onClicked: {

    }
}'
    }

    BFrame{
        Layout.fillWidth: true
        Layout.preferredHeight: 68
        Layout.topMargin: 20
        padding: 10

        BFilledButton{
            disabled: filled_button_switch.checked
            text: qsTr("Filled Button")
            onClicked: {
                showWarning(qsTr("Click FilledButton"))
            }
            anchors{
                verticalCenter: parent.verticalCenter
                left: parent.left
            }
        }
        BToggleSwitch{
            id: filled_button_switch
            anchors{
                right: parent.right
                verticalCenter: parent.verticalCenter
            }
            text: qsTr("Disabled")
        }
    }
    CodeExpander{
        Layout.fillWidth: true
        Layout.topMargin: -6
        code:'BFilledButton{
    text:"Filled Button"
    onClicked: {

    }
}'
    }

    BFrame{
        Layout.fillWidth: true
        Layout.preferredHeight: 68
        Layout.topMargin: 20
        padding: 10

        BToggleButton{
            disabled:toggle_button_switch.checked
            text: qsTr("Toggle Button")
            anchors{
                verticalCenter: parent.verticalCenter
                left: parent.left
            }
        }
        BToggleSwitch{
            id: toggle_button_switch
            anchors{
                right: parent.right
                verticalCenter: parent.verticalCenter
            }
            text: qsTr("Disabled")
        }
    }
    CodeExpander{
        Layout.fillWidth: true
        Layout.topMargin: -6
        code:'BToggleButton{
    text:"Toggle Button"
    onClicked: {
        checked = !checked
    }
}'
    }

    Timer{
        id: timer_progress
        interval: 200
        onTriggered: {
            btn_progress.progress = (btn_progress.progress + 0.1).toFixed(1)
            if(btn_progress.progress==1){
                timer_progress.stop()
            }else{
                timer_progress.start()
            }
        }
    }

    BFrame{
        Layout.fillWidth: true
        Layout.preferredHeight: 68
        Layout.topMargin: 20
        padding: 10

        BProgressButton{
            id: btn_progress
            disabled: progress_button_switch.checked
            text: qsTr("Progress Button")
            anchors{
                verticalCenter: parent.verticalCenter
                left: parent.left
            }
            onClicked: {
                btn_progress.progress = 0
                timer_progress.restart()
            }
        }
        BToggleSwitch{
            id: progress_button_switch
            anchors{
                right: parent.right
                verticalCenter: parent.verticalCenter
            }
            text: qsTr("Disabled")
        }
    }
    CodeExpander{
        Layout.fillWidth: true
        Layout.topMargin: -6
        code:'BProgressButton{
    text:"Progress Button"
    onClicked: {

    }
}'
    }

    BFrame{
        Layout.fillWidth: true
        Layout.preferredHeight: 68
        Layout.topMargin: 20
        padding: 10

        BLoadingButton{
            id: btn_loading
            loading: loading_button_switch.checked
            text: qsTr("Loading Button")
            anchors{
                verticalCenter: parent.verticalCenter
                left: parent.left
            }
            onClicked: {

            }
        }
        BToggleSwitch{
            id: loading_button_switch
            checked: true
            anchors{
                right: parent.right
                verticalCenter: parent.verticalCenter
            }
            text: qsTr("Loading")
        }
    }
    CodeExpander{
        Layout.fillWidth: true
        Layout.topMargin: -6
        code:'BLoadingButton{
    text:"Loading Button"
    onClicked: {

    }
}'
    }


    BFrame{
        Layout.fillWidth: true
        Layout.preferredHeight: layout_icon_button.height + 30
        padding: 10
        Layout.topMargin: 20
        Flow{
            id: layout_icon_button
            spacing: 10
            anchors{
                verticalCenter: parent.verticalCenter
                left: parent.left
                right: icon_button_switch.left
            }
            BIconButton{
                disabled: icon_button_switch.checked
                iconDelegate: Image{ sourceSize: Qt.size(40,40) ; width: 20; height: 20; source: "qrc:/example/res/image/ic_home_github.png" }
                onClicked:{
                    showSuccess(qsTr("Click IconButton"))
                }
            }
            BIconButton{
                iconSource: BeautyIcons.ChromeCloseContrast
                disabled: icon_button_switch.checked
                iconSize: 15
                text: qsTr("IconOnly")
                display: Button.IconOnly
                onClicked:{
                    showSuccess(qsTr("Button.IconOnly"))
                }
            }
            BIconButton{
                iconSource: BeautyIcons.ChromeCloseContrast
                disabled: icon_button_switch.checked
                iconSize: 15
                text: qsTr("TextOnly")
                display: Button.TextOnly
                onClicked:{
                    showSuccess(qsTr("Button.TextOnly"))
                }
            }
            BIconButton{
                iconSource: BeautyIcons.ChromeCloseContrast
                disabled: icon_button_switch.checked
                iconSize: 15
                text: qsTr("TextBesideIcon")
                display: Button.TextBesideIcon
                onClicked:{
                    showSuccess(qsTr("Button.TextBesideIcon"))
                }
            }
            BIconButton{
                iconSource: BeautyIcons.ChromeCloseContrast
                disabled: icon_button_switch.checked
                iconSize: 15
                text: qsTr("TextUnderIcon")
                display: Button.TextUnderIcon
                onClicked:{
                    showSuccess(qsTr("Button.TextUnderIcon"))
                }
            }
        }
        BToggleSwitch{
            id: icon_button_switch
            anchors{
                right: parent.right
                verticalCenter: parent.verticalCenter
            }
            text: qsTr("Disabled")
        }
    }
    CodeExpander{
        Layout.fillWidth: true
        Layout.topMargin: -6
        code:'BIconButton{
    iconSource:BeautyIcons.ChromeCloseContrast
    onClicked: {

    }
}'
    }

    BFrame{
        Layout.fillWidth: true
        Layout.preferredHeight: 68
        padding: 10
        Layout.topMargin: 20
        BDropDownButton{
            disabled: drop_down_button_switch.checked
            text: qsTr("DropDownButton")
            anchors{
                verticalCenter: parent.verticalCenter
                left: parent.left
            }
            BMenuItem{
                text: qsTr("Menu_1")
            }
            BMenuItem{
                text: qsTr("Menu_2")
            }
            BMenuItem{
                text: qsTr("Menu_3")
            }
            BMenuItem{
                text: qsTr("Menu_4")
                onClicked: {

                }
            }
        }
        BToggleSwitch{
            id: drop_down_button_switch
            anchors{
                right: parent.right
                verticalCenter: parent.verticalCenter
            }
            text: qsTr("Disabled")
        }
    }
    CodeExpander{
        Layout.fillWidth: true
        Layout.topMargin: -6
        code:'BDropDownButton{
    text:"DropDownButton"
    BMenuItem{
        text:"Menu_1"
    },
    BMenuItem{
        text:"Menu_2"
    },
    BMenuItem{
        text:"Menu_3"
    },
    BMenuItem{
        text:"Menu_4"
    }
}'
    }

    BFrame{
        Layout.fillWidth: true
        Layout.preferredHeight: 100
        padding: 10
        Layout.topMargin: 20
        BRadioButtons{
            spacing: 8
            anchors{
                verticalCenter: parent.verticalCenter
                left: parent.left
            }
            BRadioButton{
                disabled:radio_button_switch.checked
                text: qsTr("Radio Button_1")
            }
            BRadioButton{
                disabled:radio_button_switch.checked
                text: qsTr("Radio Button_2")
            }
            BRadioButton{
                disabled:radio_button_switch.checked
                text: qsTr("Radio Button_3")
            }
        }
        BToggleSwitch{
            id: radio_button_switch
            anchors{
                right: parent.right
                verticalCenter: parent.verticalCenter
            }
            text: qsTr("Disabled")
        }
    }
    CodeExpander{
        Layout.fillWidth: true
        Layout.topMargin: -6
        code:'BRadioButton{
    checked:true
    text:"Text Button"
    onClicked: {

    }
}'
    }

}
