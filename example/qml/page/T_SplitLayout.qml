import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import BeautyUI 1.0
import "../component"

BContentPage{

    title: qsTr("SplitLayout")

    RowLayout{
        id:layout_dropdown
        anchors{
            top: parent.top
        }
        BText{
            text:"orientation:"
        }
        BDropDownButton{
            id:btn_orientation
            Layout.preferredWidth: 120
            text:"Horizontal"
            BMenuItem{
                text:"Horizontal"
                onClicked: {
                    btn_orientation.text = text
                    split_layout.orientation = Qt.Horizontal
                }
            }
            BMenuItem{
                text:"Vertical"
                onClicked: {
                    btn_orientation.text = text
                    split_layout.orientation = Qt.Vertical
                }
            }
        }
    }
    BSplitLayout {
        id:split_layout
        anchors{
            top: layout_dropdown.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom
            topMargin: 8
        }
        orientation: Qt.Horizontal
        Item {
            clip: true
            implicitWidth: 200
            implicitHeight: 200
            SplitView.maximumWidth: 400
            SplitView.maximumHeight: 400
            BText {
                text: "Page 1"
                anchors.centerIn: parent
            }
        }
        Item {
            clip: true
            id: centerItem
            SplitView.minimumWidth: 50
            SplitView.minimumHeight: 50
            SplitView.fillWidth: true
            SplitView.fillHeight: true
            BText {
                text: "Page 2"
                anchors.centerIn: parent
            }
        }
        Item {
            clip: true
            implicitWidth: 200
            implicitHeight: 200
            BText {
                text: "Page 3"
                anchors.centerIn: parent
            }
        }
    }
}
