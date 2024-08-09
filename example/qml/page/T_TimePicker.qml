import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import BeautyUI 1.0
import "../component"

BScrollablePage{

    title: qsTr("TimePicker")
    launchMode: BPageType.SingleInstance
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
                text: qsTr("hourFormat=BTimePickerType.H")
            }

            BTimePicker{
                current: new Date()
                amText: qsTr("AM")
                pmText: qsTr("PM")
                hourText: qsTr("Hour")
                minuteText: qsTr("Minute")
                cancelText: qsTr("Cancel")
                okText: qsTr("OK")
                onAccepted: {
                    showSuccess(current.toLocaleTimeString(Qt.locale("de_DE")))
                }
            }

        }
    }
    CodeExpander{
        Layout.fillWidth: true
        Layout.topMargin: -6
        code:'BTimePicker{

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
                text: qsTr("hourFormat=BTimePickerType.HH")
            }

            BTimePicker{
                hourFormat:BTimePickerType.HH
                amText: qsTr("AM")
                pmText: qsTr("PM")
                hourText: qsTr("Hour")
                minuteText: qsTr("Minute")
                cancelText: qsTr("Cancel")
                okText: qsTr("OK")
                onAccepted: {
                    showSuccess(current.toLocaleTimeString(Qt.locale("de_DE")))
                }
            }

        }
    }
    CodeExpander{
        Layout.fillWidth: true
        Layout.topMargin: -6
        code:'BTimePicker{
    hourFormat:BTimePickerType.HH
}'
    }

}
