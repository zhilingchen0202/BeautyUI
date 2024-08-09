import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import BeautyUI 1.0
import "../component"

BScrollablePage{

    title: qsTr("RadioButton")

    BFrame{
        Layout.fillWidth: true
        Layout.preferredHeight: 68
        padding: 10
        Row{
            spacing: 30
            anchors.verticalCenter: parent.verticalCenter
            BRadioButton{
                disabled: radio_button_switch.checked
            }
            BRadioButton{
                disabled: radio_button_switch.checked
                text: qsTr("Right")
            }
            BRadioButton{
                disabled: radio_button_switch.checked
                text: qsTr("Left")
                textRight: false
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
    text:"Text"
}'
    }

    BFrame{
        Layout.fillWidth: true
        Layout.preferredHeight: 100
        padding: 10
        Layout.topMargin: 20
        BRadioButtons{
            spacing: 8
            disabled: radio_button_switch2.checked
            anchors.verticalCenter: parent.verticalCenter
            anchors{
                verticalCenter: parent.verticalCenter
                left: parent.left
            }
            currentIndex: 1
            BRadioButton{
                text: qsTr("Radio Button_1")
            }
            BRadioButton{
                text: qsTr("Radio Button_2")
            }
            BRadioButton{
                text: qsTr("Radio Button_3")
            }
        }
        BToggleSwitch{
            id: radio_button_switch2
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
        code:'BRadioButtons{
    spacing: 8
    BRadioButton{
        text:"Radio Button_1"
    }
    BRadioButton{
        text:"Radio Button_2"
    }
    BRadioButton{
        text:"Radio Button_3"
    }
}'
    }

    BFrame{
        Layout.fillWidth: true
        Layout.preferredHeight: 60
        padding: 10
        Layout.topMargin: 20
        BRadioButtons{
            spacing: 8
            anchors.verticalCenter: parent.verticalCenter
            anchors{
                verticalCenter: parent.verticalCenter
                left: parent.left
            }
            disabled: radio_button_switch3.checked
            orientation: Qt.Horizontal
            currentIndex: 1
            BRadioButton{
                text: qsTr("Radio Button_1")
            }
            BRadioButton{
                text: qsTr("Radio Button_2")
            }
            BRadioButton{
                text: qsTr("Radio Button_3")
            }
        }
        BToggleSwitch{
            id: radio_button_switch3
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
        code:'BRadioButtons{
    spacing: 8
    orientation: Qt.Horizontal
    BRadioButton{
        text:"Radio Button_1"
    }
    BRadioButton{
        text:"Radio Button_2"
    }
    BRadioButton{
        text:"Radio Button_3"
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
            anchors.verticalCenter: parent.verticalCenter
            anchors{
                verticalCenter: parent.verticalCenter
                left: parent.left
            }
            disabled: radio_button_switch4.checked
            currentIndex: -1
            BCheckBox{
                text: qsTr("Radio Button_1")
            }
            BCheckBox{
                text: qsTr("Radio Button_2")
            }
            BCheckBox{
                text: qsTr("Radio Button_3")
            }
        }
        BToggleSwitch{
            id: radio_button_switch4
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
        code:'BRadioButtons{
    spacing: 8
    BCheckBox{
        text:"Radio Button_1"
    }
    BCheckBox{
        text:"Radio Button_2"
    }
    BCheckBox{
        text:"Radio Button_3"
    }
}'
    }

}
