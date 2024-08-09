import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import BeautyUI 1.0
import "../component"

BScrollablePage{

    title: qsTr("ToggleSwitch")

    BFrame{
        Layout.fillWidth: true
        Layout.preferredHeight: 68
        padding: 10
        Row{
            spacing: 30
            anchors.verticalCenter: parent.verticalCenter
            BToggleSwitch{
                disabled: toggle_switch.checked
            }
            BToggleSwitch{
                disabled: toggle_switch.checked
                text: qsTr("Right")
            }
            BToggleSwitch{
                disabled: toggle_switch.checked
                text: qsTr("Left")
                textRight: false
            }
        }
        BToggleSwitch{
            id: toggle_switch
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
        code:'BToggleSwitch{
    text:"Text"
}'
    }


}
