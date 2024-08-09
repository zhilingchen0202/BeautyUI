import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import BeautyUI 1.0
import "../component"

BScrollablePage{

    title: qsTr("InfoBar")

    property var info1
    property var info2
    property var info3

    BFrame{
        Layout.fillWidth: true
        Layout.preferredHeight: 350
        padding: 10
        ColumnLayout{
            spacing: 14
            anchors{
                verticalCenter: parent.verticalCenter
                left: parent.left
            }
            BButton{
                text: qsTr("Info")
                onClicked: {
                    showInfo(qsTr("This is an InfoBar in the Info Style"))
                }
            }
            BButton{
                text: qsTr("Warning")
                onClicked: {
                    showWarning(qsTr("This is an InfoBar in the Warning Style"))
                }
            }
            BButton{
                text:"Error"
                onClicked: {
                    showError(qsTr("This is an InfoBar in the Error Style"))
                }
            }
            BButton{
                text:"Success"
                onClicked: {
                    showSuccess(qsTr("This is an InfoBar in the Success Style"))
                }
            }
            BButton{
                text: qsTr("InfoBar that needs to be turned off manually")
                onClicked: {
                    showInfo(qsTr("This is an InfoBar in the Info Style"),0,qsTr("Manual shutdown is supported"))
                }
            }
            BText{
                wrapMode: Text.WrapAnywhere
                width: parent.width
                text: qsTr("Manually close the info message box")
            }
            Row{
                spacing: 5
                BButton{
                    text: (info1 ? qsTr("close '%1'") : qsTr("show '%1")).arg("info1")
                    onClicked: {
                        if(info1) {
                            info1.close()
                            return
                        }
                        info1 = showInfo(qsTr("This is an '%1'").arg("info1"), 0)
                    }
                }
                BButton{
                    text: (info2 ? qsTr("close '%1'") : qsTr("show '%1")).arg("info2")
                    onClicked: {
                        if(info2) {
                            info2.close()
                            return
                        }
                        info2 = showInfo(qsTr("This is an '%1'").arg("info2"), 0)
                    }
                }
                BButton{
                    text: (info3 ? qsTr("close '%1'") : qsTr("show '%1")).arg("info3")
                    onClicked: {
                        if(info3) {
                            info3.close()
                            return
                        }
                        info3 = showInfo(qsTr("This is an '%1'").arg("info3"), 0)
                    }
                }
                BButton{
                    text: qsTr("clear all info")
                    onClicked: {
                        clearAllInfo()
                    }
                }
            }

            BButton{
                text:"Loading"
                onClicked: {
                    showLoading()
                }
            }
        }
    }
    CodeExpander{
        Layout.fillWidth: true
        Layout.topMargin: -6
        code:`
showInfo(qsTr("This is an InfoBar in the Info Style"))

showWarning(qsTr("This is an InfoBar in the Warning Style"))

showError(qsTr("This is an InfoBar in the Error Style"))

showSuccess(qsTr("This is an InfoBar in the Success Style"))

var info1 = showInfo(qsTr("This is an 'Info1'"), 0)
info1.close()
`
    }
}
