import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import BeautyUI 1.0
import "../component"

BScrollablePage{

    title: qsTr("ShortcutPicker")

    BFrame{
        Layout.fillWidth: true
        Layout.preferredHeight: childrenRect.height
        ColumnLayout{
            anchors.verticalCenter: parent.verticalCenter
            Item{
                Layout.preferredHeight: 15
            }
            Repeater{
                model: BApp.launcher.hotkeys.children
                delegate: BShortcutPicker{
                    text: model.name
                    syncHotkey: BApp.launcher.hotkeys.children[index]
                    Layout.leftMargin: 15
                }
            }
            Item{
                Layout.preferredHeight: 15
            }
        }
    }

    CodeExpander{
        Layout.fillWidth: true
        Layout.topMargin: -6
        code:'BShortcutPicker{

}'
    }

}
