import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import BeautyUI 1.0
import Qt.labs.platform 1.0
import "../component"

BWindow {

    id:window
    title: qsTr("Friendly Reminder")
    width: 300
    height: 400
    fixSize: true
    showMinimize: false

    property string crashFilePath

    Component.onCompleted: {
        window.stayTop = true
    }

    onInitArgument:
        (argument)=>{
            crashFilePath = argument.crashFilePath
        }

    Image{
        width: 540/2
        height: 285/2
        anchors{
            horizontalCenter: parent.horizontalCenter
            top: parent.top
            topMargin: 40
        }
        source: "qrc:/example/res/image/ic_crash.png"
    }

    BText{
        id:text_info
        anchors{
            top: parent.top
            topMargin: 240
            left: parent.left
            right: parent.right
            leftMargin: 10
            rightMargin: 10
        }
        wrapMode: Text.WrapAnywhere
        text: qsTr("We apologize for the inconvenience caused by an unexpected error")
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

    RowLayout{
        anchors{
            horizontalCenter: parent.horizontalCenter
            bottom: parent.bottom
            bottomMargin: 20
        }
        BButton{
            text: qsTr("Report Logs")
            onClicked: {
                BTools.showFileInFolder(crashFilePath)
            }
        }
        Item{
            width: 30
            height: 1
        }
        BFilledButton{
            text: qsTr("Restart Program")
            onClicked: {
                BRouter.exit(931)
            }
        }
    }

}
