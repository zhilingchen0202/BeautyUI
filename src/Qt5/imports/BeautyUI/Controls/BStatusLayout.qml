import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import BeautyUI 1.0

Item{
    id:control
    default property alias content: container.data
    property int statusMode: BStatusLayoutType.Loading
    property string loadingText: qsTr("Loading...")
    property string emptyText: qsTr("Empty")
    property string errorText: qsTr("Error")
    property string errorButtonText: qsTr("Reload")
    property color color: Qt.rgba(0,0,0,0)
    signal errorClicked
    property Component loadingItem : com_loading
    property Component emptyItem : com_empty
    property Component errorItem : com_error

    Item{
        id:container
        anchors.fill: parent
        visible: statusMode===BStatusLayoutType.Success
    }
    BLoader{
        id:loader
        anchors.fill: parent
        visible: statusMode!==BStatusLayoutType.Success
        sourceComponent: {
            if(statusMode === BStatusLayoutType.Loading){
                return loadingItem
            }
            if(statusMode === BStatusLayoutType.Empty){
                return emptyItem
            }
            if(statusMode === BStatusLayoutType.Error){
                return errorItem
            }
            return undefined
        }
    }
    Component{
        id:com_loading
        BFrame{
            padding: 0
            border.width: 0
            radius: 0
            color:control.color
            ColumnLayout{
                anchors.centerIn: parent
                BProgressRing{
                    indeterminate: true
                    Layout.alignment: Qt.AlignHCenter
                }
                BText{
                    text:control.loadingText
                    Layout.alignment: Qt.AlignHCenter
                }
            }
        }
    }
    Component {
        id:com_empty
        BFrame{
            padding: 0
            border.width: 0
            radius: 0
            color:control.color
            ColumnLayout{
                anchors.centerIn: parent
                BText{
                    text:control.emptyText
                    font: BTextStyle.BodyStrong
                    Layout.alignment: Qt.AlignHCenter
                }
            }
        }
    }
    Component{
        id:com_error
        BFrame{
            padding: 0
            border.width: 0
            radius: 0
            color:control.color
            ColumnLayout{
                anchors.centerIn: parent
                BText{
                    text:control.errorText
                    font: BTextStyle.BodyStrong
                    Layout.alignment: Qt.AlignHCenter
                }
                BFilledButton{
                    id:btn_error
                    Layout.alignment: Qt.AlignHCenter
                    text:control.errorButtonText
                    onClicked:{
                        control.errorClicked()
                    }
                }
            }
        }
    }
    function showSuccessView(){
        statusMode = BStatusLayoutType.Success
    }
    function showLoadingView(){
        statusMode = BStatusLayoutType.Loading
    }
    function showEmptyView(){
        statusMode = BStatusLayoutType.Empty
    }
    function showErrorView(){
        statusMode = BStatusLayoutType.Error
    }
}
