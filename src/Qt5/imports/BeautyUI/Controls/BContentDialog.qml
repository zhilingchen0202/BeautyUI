import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
import BeautyUI 1.0

BPopup {
    id: control
    property string title: ""
    property string message: ""
    property string neutralText: qsTr("Close")
    property string negativeText: qsTr("Cancel")
    property string positiveText: qsTr("OK")
    property int messageTextFormart: Text.AutoText
    property int delayTime: 100
    property int buttonFlags: BContentDialogType.NegativeButton | BContentDialogType.PositiveButton
    property var contentDelegate:  Component{
        Item{
        }
    }
    property var onNeutralClickListener
    property var onNegativeClickListener
    property var onPositiveClickListener
    signal neutralClicked
    signal negativeClicked
    signal positiveClicked
    implicitWidth: 400
    implicitHeight: layout_content.height
    focus: true
    Component{
        id:com_message
        Flickable{
            id:sroll_message
            contentHeight: text_message.height
            contentWidth: width
            clip: true
            boundsBehavior:Flickable.StopAtBounds
            width: parent.width
            height: message === "" ? 0 : Math.min(text_message.height,300)
            ScrollBar.vertical: BScrollBar {}
            BText{
                id:text_message
                font: BTextStyle.Body
                wrapMode: Text.WrapAnywhere
                text:message
                width: parent.width
                topPadding: 4
                leftPadding: 20
                rightPadding: 20
                bottomPadding: 4
            }
        }
    }
    Rectangle {
        id:layout_content
        width: parent.width
        height: layout_column.childrenRect.height
        color: 'transparent'
        radius:5
        ColumnLayout{
            id:layout_column
            width: parent.width
            BText{
                id:text_title
                font: BTextStyle.Title
                text:title
                topPadding: 20
                leftPadding: 20
                rightPadding: 20
                wrapMode: Text.WrapAnywhere
            }
            BLoader{
                sourceComponent: com_message
                Layout.fillWidth: true
                Layout.preferredHeight: status===Loader.Ready ? item.height : 0
            }
            BLoader{
                sourceComponent:control.visible ? control.contentDelegate : undefined
                Layout.fillWidth: true
                onStatusChanged: {
                    if(status===Loader.Ready){
                        Layout.preferredHeight = item.implicitHeight
                    }else{
                        Layout.preferredHeight = 0
                    }
                }
            }
            Rectangle{
                id:layout_actions
                Layout.fillWidth: true
                Layout.preferredHeight: 60
                radius: 5
                color: BTheme.dark ? Qt.rgba(32/255,32/255,32/255,1) : Qt.rgba(243/255,243/255,243/255,1)
                RowLayout{
                    anchors
                    {
                        centerIn: parent
                        margins: spacing
                        fill: parent
                    }
                    spacing: 10
                    Item{
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        BButton{
                            id:neutral_btn
                            visible: control.buttonFlags&BContentDialogType.NeutralButton
                            text: neutralText
                            width: parent.width
                            anchors.centerIn: parent
                            onClicked: {
                                if(control.onNeutralClickListener){
                                    control.onNeutralClickListener()
                                }else{
                                    neutralClicked()
                                    control.close()
                                }
                            }
                        }
                    }
                    Item{
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        BButton{
                            id:negative_btn
                            visible: control.buttonFlags&BContentDialogType.NegativeButton
                            width: parent.width
                            anchors.centerIn: parent
                            text: negativeText
                            onClicked: {
                                if(control.onNegativeClickListener){
                                    control.onNegativeClickListener()
                                }else{
                                    negativeClicked()
                                    control.close()
                                }
                            }
                        }
                    }
                    Item{
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        BFilledButton{
                            id:positive_btn
                            visible: control.buttonFlags&BContentDialogType.PositiveButton
                            text: positiveText
                            width: parent.width
                            anchors.centerIn: parent
                            onClicked: {
                                if(control.onPositiveClickListener){
                                    control.onPositiveClickListener()
                                }else{
                                    positiveClicked()
                                    control.close()
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
