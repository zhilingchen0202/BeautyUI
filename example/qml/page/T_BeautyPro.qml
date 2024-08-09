import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
import BeautyUI 1.0
import "../component"

BContentPage{

    title: "BeautyUI Pro"

    Image{
        id: iamge_logo
        width: 80
        height: 80
        source: "qrc:/example/res/image/logo_pro.png"
    }

    Flickable{
        anchors{
            top: iamge_logo.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
        ScrollBar.vertical: BScrollBar {}
        ScrollBar.horizontal: BScrollBar {}
        contentWidth: text.width
        contentHeight: text.height
        clip: true
        BText{
            id: text
            textFormat: Text.MarkdownText
            onLinkActivated:
                (link)=> {
                    Qt.openUrlExternally(link)
                }
            onLinkHovered:
                (link)=> {
                    if(link === ""){
                        BTools.restoreOverrideCursor()
                    }else{
                        BTools.setOverrideCursor(Qt.PointingHandCursor)
                    }
                }
            text:''
        }
    }

}
