import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import BeautyUI 1.0

BContentPage {

    title: qsTr("Icons")

    BTextBox{
        id: text_box
        placeholderText: qsTr("Please enter a keyword")
        anchors{
            top: parent.top
        }
        onTextChanged: {
            grid_view.model = BApp.iconData(text_box.text)
        }
    }
    GridView{
        id: grid_view
        cellWidth: 110
        cellHeight: 110
        clip: true
        boundsBehavior: GridView.StopAtBounds
        model: BApp.iconData()
        ScrollBar.vertical: BScrollBar {}
        anchors{
            topMargin: 10
            top: text_box.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
        delegate: Item {
            width: 100
            height: 100
            BIconButton{
                id:item_icon
                iconSource: modelData.icon
                iconSize: 30
                padding: 0
                verticalPadding: 0
                horizontalPadding: 0
                bottomPadding: 30
                anchors.fill: parent
                onClicked: {
                    var text  ="BeautyIcons."+modelData.name;
                    BTools.clipText(text)
                    showSuccess(qsTr("You Copied ")+text)
                }
                BText{
                    width: parent.width
                    horizontalAlignment: Qt.AlignHCenter
                    wrapMode: Text.WrapAnywhere
                    text: modelData.name
                    anchors.top: parent.top
                    anchors.topMargin: 60
                }
            }
        }
    }
}
