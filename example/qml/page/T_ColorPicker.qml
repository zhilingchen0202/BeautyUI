import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import BeautyUI 1.0
import "../component"

BScrollablePage{

    title: qsTr("ColorPicker")

    BFrame{
        Layout.fillWidth: true
        Layout.preferredHeight: 60
        padding: 10
        RowLayout{
            BText{
                text: qsTr("Click to Select a Color - >")
                Layout.alignment: Qt.AlignVCenter
            }
            BColorPicker{}
        }
    }
    CodeExpander{
        Layout.fillWidth: true
        Layout.topMargin: -6
        code:'BColorPicker{

}'
    }

}
