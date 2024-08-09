import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import BeautyUI 1.0
import "../component"

BScrollablePage{

    title: qsTr("Captcha")

    BCaptcha{
        id: captcha
        ignoreCase:switch_case.checked
        MouseArea{
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            onClicked: {
                captcha.refresh()
            }
        }
    }

    BButton{
        text: qsTr("Refresh")
        Layout.topMargin: 20
        onClicked: {
            captcha.refresh()
        }
    }

    BToggleSwitch{
        id: switch_case
        text: qsTr("Ignore Case")
        checked: true
        Layout.topMargin: 10
    }

    RowLayout{
        spacing: 10
        Layout.topMargin: 10
        BTextBox{
            id:text_box
            placeholderText: qsTr("Please enter a verification code")
            Layout.preferredWidth: 240
        }
        BButton{
            text:"verify"
            onClicked: {
                var success =  captcha.verify(text_box.text)
                if(success){
                    showSuccess(qsTr("The verification code is correct"))
                }else{
                    showError(qsTr("Error validation, please re-enter"))
                }
            }
        }
    }
}
