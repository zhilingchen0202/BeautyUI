import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
import BeautyUI 1.0
import "../component"

BScrollablePage{

    title: qsTr("Sheet")

    BSheet{
        id:sheet
        title: qsTr("Title")
        BText{
            text: qsTr("Some contents...\nSome contents...\nSome contents...")
            anchors{
                left: parent.left
                leftMargin: 10
            }
        }
    }

    BFrame{
        Layout.fillWidth: true
        Layout.preferredHeight: 280
        padding: 10
        Column{
            anchors.centerIn: parent
            spacing: 10
            Row{
                spacing: 10
                BButton{
                    width: 80
                    height: 30
                    text: qsTr("top")
                    onClicked: {
                        sheet.open(BSheetType.Top)
                    }
                }
                BButton{
                    width: 80
                    height: 30
                    text: qsTr("right")
                    onClicked: {
                        sheet.open(BSheetType.Right)
                    }
                }
            }
            Row{
                spacing: 10
                BButton{
                    width: 80
                    height: 30
                    text: qsTr("bottom")
                    onClicked: {
                        sheet.open(BSheetType.Bottom)
                    }
                }
                BButton{
                    width: 80
                    height: 30
                    text: qsTr("left")
                    onClicked: {
                        sheet.open(BSheetType.Left)
                    }
                }
            }
        }
    }

    CodeExpander{
        Layout.fillWidth: true
        Layout.topMargin: -6
        code:'BSheet{
    id:sheet
    title: qsTr("Title")
    BText{
        text: qsTr("Some contents...")
        anchors{
            left: parent.left
            leftMargin: 10
        }
    }
}
sheet.open(BSheetType.Bottom)
'
    }

}
