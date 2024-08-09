import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import BeautyUI 1.0
import "../component"

BScrollablePage{

    title: qsTr("DatePicker")

    BFrame{
        Layout.fillWidth: true
        Layout.preferredHeight: 80
        padding: 10
        ColumnLayout{
            anchors{
                verticalCenter: parent.verticalCenter
                left: parent.left
            }
            BText{
                text: qsTr("showYear=true")
            }
            BDatePicker{
                current: new Date()
                onAccepted: {
                    showSuccess(current.toLocaleDateString())
                }
            }
        }
    }
    CodeExpander{
        Layout.fillWidth: true
        Layout.topMargin: -6
        code:'BDatePicker{

}'
    }

    BFrame{
        Layout.fillWidth: true
        Layout.topMargin: 20
        Layout.preferredHeight: 80
        padding: 10
        ColumnLayout{
            anchors{
                verticalCenter: parent.verticalCenter
                left: parent.left
            }
            BText{
                text: qsTr("showYear=false")
            }
            BDatePicker{
                showYear: false
                onAccepted: {
                    showSuccess(current.toLocaleDateString())
                }
            }
        }
    }
    CodeExpander{
        Layout.fillWidth: true
        Layout.topMargin: -6
        code:'BDatePicker{
    showYear:false
}'
    }

}
