import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import BeautyUI 1.0
import "../component"

BScrollablePage{

    title: qsTr("TextBox")

    BFrame{
        Layout.fillWidth: true
        Layout.preferredHeight: 68
        padding: 10

        BTextBox{
            placeholderText: qsTr("Single-line Input Box")
            disabled: text_box_switch.checked
            cleanEnabled: true
            anchors{
                verticalCenter: parent.verticalCenter
                left: parent.left
            }
        }

        BToggleSwitch{
            id: text_box_switch
            anchors{
                verticalCenter: parent.verticalCenter
                right: parent.right
            }
            text: qsTr("Disabled")
        }
    }
    CodeExpander{
        Layout.fillWidth: true
        Layout.topMargin: -6
        code:'BTextBox{
    placeholderText: qsTr("Single-line Input Box")
}'
    }

    BFrame{
        Layout.fillWidth: true
        Layout.preferredHeight: 68
        padding: 10
        Layout.topMargin: 20

        BPasswordBox{
            placeholderText: qsTr("Please enter your password")
            disabled:password_box_switch.checked
            anchors{
                verticalCenter: parent.verticalCenter
                left: parent.left
            }
        }
        BToggleSwitch{
            id:password_box_switch
            anchors{
                verticalCenter: parent.verticalCenter
                right: parent.right
            }
            text: qsTr("Disabled")
        }
    }
    CodeExpander{
        Layout.fillWidth: true
        Layout.topMargin: -6
        code:'BPasswordBox{
    placeholderText: qsTr("Please enter your password")
}'
    }

    BFrame{
        Layout.fillWidth: true
        Layout.preferredHeight: 36+multiine_textbox.height
        padding: 10
        Layout.topMargin: 20

        BMultilineTextBox{
            id: multiine_textbox
            placeholderText: qsTr("Multi-line Input Box")
            disabled: text_box_multi_switch.checked
            anchors{
                verticalCenter: parent.verticalCenter
                left: parent.left
            }
        }

        BToggleSwitch{
            id:text_box_multi_switch
            anchors{
                verticalCenter: parent.verticalCenter
                right: parent.right
            }
            text: qsTr("Disabled")
        }
    }
    CodeExpander{
        Layout.fillWidth: true
        Layout.topMargin: -6
        code:'BMultilineTextBox{
    placeholderText: qsTr("Multi-line Input Box")
}'
    }

    BFrame{
        Layout.fillWidth: true
        Layout.preferredHeight: 68
        padding: 10
        Layout.topMargin: 20
        BAutoSuggestBox{
            placeholderText: qsTr("AutoSuggestBox")
            items: generateRandomNames(100)
            disabled: text_box_suggest_switch.checked
            anchors{
                verticalCenter: parent.verticalCenter
                left: parent.left
            }
        }
        BToggleSwitch{
            id:text_box_suggest_switch
            anchors{
                verticalCenter: parent.verticalCenter
                right: parent.right
            }
            text: qsTr("Disabled")
        }
    }
    CodeExpander{
        Layout.fillWidth: true
        Layout.topMargin: -6
        code:'BAutoSuggestBox{
    placeholderText: qsTr("AutoSuggestBox")
}'
    }

    BFrame{
        Layout.fillWidth: true
        Layout.preferredHeight: 68
        padding: 10
        Layout.topMargin: 20
        BSpinBox{
            disabled: spin_box_switch.checked
            anchors{
                verticalCenter: parent.verticalCenter
                left: parent.left
            }
        }
        BToggleSwitch{
            id: spin_box_switch
            anchors{
                verticalCenter: parent.verticalCenter
                right: parent.right
            }
            text: qsTr("Disabled")
        }
    }
    CodeExpander{
        Layout.fillWidth: true
        Layout.topMargin: -6
        code:'BSpinBox{

}'
    }

    function generateRandomNames(numNames) {
        const alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
        const names = [];
        function generateRandomName() {
            const nameLength = Math.floor(Math.random() * 5) + 4;
            let name = '';
            for (let i = 0; i < nameLength; i++) {
                const letterIndex = Math.floor(Math.random() * 26);
                name += alphabet.charAt(letterIndex);
            }
            return name;
        }
        for (let i = 0; i < numNames; i++) {
            const name = generateRandomName();
            names.push({title:name});
        }
        return names;
    }


}
