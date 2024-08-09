import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import BeautyUI 1.0
import "../component"

BScrollablePage{

    title: qsTr("GroupBox")

    BGroupBox {
        title: qsTr("CheckBox Group")
        ColumnLayout {
            spacing: 10
            anchors.fill: parent
            BCheckBox { text: qsTr("E-mail") }
            BCheckBox { text: qsTr("Calendar") }
            BCheckBox { text: qsTr("Contacts") }
        }
    }

    BGroupBox {
        title: qsTr("RadioButton Group")
        Layout.fillWidth: true
        Layout.preferredHeight: 150
        Layout.topMargin: 20
        BRadioButtons {
            anchors{
                verticalCenter: parent.verticalCenter
                left: parent.left
            }
            spacing: 10
            disabled: radio_button_switch.checked
            BRadioButton { text: qsTr("E-mail") }
            BRadioButton { text: qsTr("Calendar") }
            BRadioButton { text: qsTr("Contacts") }
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
        Layout.topMargin: 4
        code:`
BGroupBox {
    title: qsTr("CheckBox Group")
    ColumnLayout {
        spacing: 10
        anchors.fill: parent
        BCheckBox { text: qsTr("E-mail") }
        BCheckBox { text: qsTr("Calendar") }
        BCheckBox { text: qsTr("Contacts") }
    }
}

BGroupBox {
    title: qsTr("RadioButton Group")
    BRadioButtons {
        spacing: 10
        disabled: true // 禁用所有BRadioButton子组件
        manuallyDisabled: true // 是否指定每个BRadioButton上的disabled选项
        BRadioButton { text: qsTr("E-mail") }
        BRadioButton { text: qsTr("Calendar") }
        BRadioButton { text: qsTr("Contacts") }
    }
}
`
    }

}
