import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
import BeautyUI 1.0
import "../component"

BScrollablePage{

    title: qsTr("StatusLayout")

    BFrame{
        id:layout_actions
        Layout.fillWidth: true
        Layout.preferredHeight: 50
        padding: 10
        RowLayout{
            spacing: 14
            BDropDownButton{
                id:btn_status_mode
                Layout.preferredWidth: 140
                text:"Loading"
                BMenuItem{
                    text:"Loading"
                    onClicked: {
                        btn_status_mode.text = text
                        status_view.statusMode = BStatusLayoutType.Loading
                    }
                }
                BMenuItem{
                    text:"Empty"
                    onClicked: {
                        btn_status_mode.text = text
                        status_view.statusMode = BStatusLayoutType.Empty
                    }
                }
                BMenuItem{
                    text:"Error"
                    onClicked: {
                        btn_status_mode.text = text
                        status_view.statusMode = BStatusLayoutType.Error
                    }
                }
                BMenuItem{
                    text:"Success"
                    onClicked: {
                        btn_status_mode.text = text
                        status_view.statusMode = BStatusLayoutType.Success
                    }
                }
            }
        }
    }

    BFrame{
        Layout.fillWidth: true
        Layout.topMargin: 10
        Layout.preferredHeight: 380
        padding: 10
        BStatusLayout{
            id:status_view
            anchors.fill: parent
            onErrorClicked:{
                status_view.statusMode = BStatusLayoutType.Loading
            }
            Rectangle {
                anchors.fill: parent
                color:BTheme.primaryColor
            }
        }
    }
    CodeExpander{
        Layout.fillWidth: true
        Layout.topMargin: -6
        code:'BStatusLayout{
    anchors.fill: parent
    statusMode: BStatusLayoutType.Loading
    Rectangle{
        anchors.fill: parent
        color:BTheme.primaryColor
    }
}'
    }

}
