import QtQuick
import QtQuick.Controls
import BeautyUI

Image {
    property string errorButtonText: qsTr("Reload")
    property var clickErrorListener : function(){
        image.source = ""
        image.source = control.source
    }
    property Component errorItem : com_error
    property Component loadingItem: com_loading
    id: control
    BLoader{
        anchors.fill: parent
        sourceComponent: {
            if(control.status === Image.Loading){
                return com_loading
            }else if(control.status == Image.Error){
                return com_error
            }else{
                return undefined
            }
        }
    }
    Component{
        id:com_loading
        Rectangle{
            color: BTheme.itemHoverColor
            BProgressRing{
                anchors.centerIn: parent
                visible: control.status === Image.Loading
            }
        }
    }
    Component{
        id:com_error
        Rectangle{
            color: BTheme.itemHoverColor
            BFilledButton{
                text: control.errorButtonText
                anchors.centerIn: parent
                visible: control.status === Image.Error
                onClicked: clickErrorListener()
            }
        }
    }
}
