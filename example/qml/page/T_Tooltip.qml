import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import BeautyUI 1.0
import "../component"

BScrollablePage{

    title: qsTr("Tooltip")

    BText{
        text: qsTr("Hover over Tultip and it pops up")
    }

    BFrame{
        Layout.fillWidth: true
        Layout.topMargin: 20
        Layout.preferredHeight: 68
        padding: 10

        Column{
            spacing: 5
            anchors{
                verticalCenter: parent.verticalCenter
                left: parent.left
            }
            BText{
                text: qsTr("Text properties of BIconButton support the Tooltip pop-up window by default")
            }
            BIconButton{
                iconSource:BeautyIcons.ChromeCloseContrast
                iconSize: 15
                text: qsTr("Delete")
                onClicked:{
                    showSuccess(qsTr("Click IconButton"))
                }
            }
        }
    }
    CodeExpander{
        Layout.fillWidth: true
        Layout.topMargin: -6
        code:'BIconButton{
    iconSource:BeautyIcons.ChromeCloseContrast
    iconSize: 15
    text: qsTr("Delete")
    onClicked:{
        showSuccess(qsTr("Click IconButton"))
    }
}
'
    }

    BFrame{
        Layout.fillWidth: true
        Layout.topMargin: 20
        Layout.preferredHeight: 68
        padding: 10

        Column{
            spacing: 5
            anchors{
                verticalCenter: parent.verticalCenter
                left: parent.left
            }
            BText{
                text: qsTr("Add a Tooltip pop-up to a Button")
            }
            BButton{
                id:button_1
                text: qsTr("Delete")
                onClicked:{
                    showSuccess(qsTr("Click Button"))
                }
                BTooltip{
                    visible: button_1.hovered
                    text:button_1.text
                    delay: 1000
                }
            }
        }
    }
    CodeExpander{
        Layout.fillWidth: true
        Layout.topMargin: -6
        code:'BButton{
    id: button_1
    text: qsTr("Delete")
    BTooltip{
        visible: button_1.hovered
        text:button_1.text
        delay: 1000
    }
    onClicked:{
        showSuccess(qsTr("Click Button"))
    }
}'
    }


}
