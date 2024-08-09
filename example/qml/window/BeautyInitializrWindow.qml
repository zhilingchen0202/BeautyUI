import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import BeautyUI 1.0
import Qt.labs.platform 1.1
import "../component"

BWindowDialog {

    id:window
    title:qsTr("BeautyUI Initializr")
    width: 600
    height: 400

    contentDelegate:Component{
        Item{
            Connections{
                target: InitializrHelper
                function onError(message){
                    showError(message)
                }
                function onSuccess(path){
                    BTools.showFileInFolder(path)
                    window.close()
                }
            }

            BText{
                id:text_title
                text:qsTr("BeautyUI Initializr")
                font: BTextStyle.Title
                anchors{
                    left: parent.left
                    top: parent.top
                    leftMargin: 20
                    topMargin: 20
                }
            }

            Column{
                spacing: 14
                anchors{
                    left: parent.left
                    top: text_title.bottom
                    leftMargin: 20
                    topMargin: 20
                }
                BTextBox{
                    id:text_box_name
                    width: 180
                    placeholderText: qsTr("Name")
                    focus: true
                }
                Row{
                    spacing: 8
                    BTextBox{
                        id:text_box_path
                        width: 300
                        placeholderText: qsTr("Create In")
                        anchors.verticalCenter: parent.verticalCenter
                    }
                    BButton{
                        text:qsTr("Browse")
                        anchors.verticalCenter: parent.verticalCenter
                        onClicked: {
                            folder_dialog.open()
                        }
                    }
                }
            }

            FolderDialog{
                id:folder_dialog
                onAccepted: {
                    text_box_path.text = BTools.toLocalPath(currentFolder)
                }
            }

            Rectangle{
                id:layout_actions
                width: parent.width
                height: 60
                anchors.bottom: parent.bottom
                color: BTheme.backgroundColor
                Row{
                    height: parent.height
                    spacing: 20
                    anchors{
                        right: parent.right
                        rightMargin: 20
                    }
                    BButton{
                        text:qsTr("Cancel")
                        width: 120
                        anchors.verticalCenter: parent.verticalCenter
                        onClicked: {
                            window.close()
                        }
                    }
                    BFilledButton{
                        text:qsTr("Create")
                        width: 120
                        anchors.verticalCenter: parent.verticalCenter
                        onClicked: {
                            InitializrHelper.generate(text_box_name.text,text_box_path.text)
                        }
                    }
                }
            }
        }
    }

}
