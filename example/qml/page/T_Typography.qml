import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import BeautyUI 1.0

BContentPage {

    property real textScale: 1

    title: qsTr("Typography")
    rightPadding: 10

    BFrame{
        anchors{
            top:parent.top
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
        padding: 10
        ColumnLayout{
            spacing: 0
            scale: textScale
            transformOrigin: Item.TopLeft
            BText{
                id:text_Display
                text:"Display"
                padding: 0
                font: BTextStyle.Display
            }
            BText{
                id:text_TitleLarge
                text:"Title Large"
                padding: 0
                font: BTextStyle.TitleLarge
            }
            BText{
                id:text_Title
                text:"Title"
                padding: 0
                font: BTextStyle.Title
            }
            BText{
                id:text_Subtitle
                text:"Subtitle"
                padding: 0
                font: BTextStyle.Subtitle
            }
            BText{
                id:text_BodyStrong
                text:"Body Strong"
                padding: 0
                font: BTextStyle.BodyStrong
            }
            BText{
                id:text_Body
                text:"Body"
                padding: 0
                font: BTextStyle.Body
            }
            BText{
                id:text_Caption
                text:"Caption"
                padding: 0
                font: BTextStyle.Caption
            }
        }

        BSlider{
            id:slider
            orientation: Qt.Vertical
            anchors{
                right: parent.right
                rightMargin: 45
                top: parent.top
                topMargin: 30
            }
            onValueChanged:{
                textScale = 1+value/100
            }
        }
    }
}
