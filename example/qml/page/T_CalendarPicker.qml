import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import BeautyUI 1.0
import "../component"

BScrollablePage{

    title: qsTr("CalendarPicker")

    BFrame{
        Layout.fillWidth: true
        Layout.preferredHeight: 80
        padding: 10
        ColumnLayout{
            anchors{
                verticalCenter: parent.verticalCenter
                left: parent.left
            }
            BCalendarPicker{
                onAccepted:{
                    showSuccess(current.toLocaleString())
                }
            }
        }
    }
    CodeExpander{
        Layout.fillWidth: true
        Layout.topMargin: -6
        code:'BCalendarPicker{

}'
    }

}
