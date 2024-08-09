import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import BeautyUI 1.0
import "../component"

BScrollablePage{

    title: qsTr("Pivot")

    BFrame{
        Layout.fillWidth: true
        Layout.preferredHeight: 400
        padding: 10

        BPivot{
            anchors.fill: parent
            currentIndex: 2

            BPivotItem{
                title: qsTr("All")
                contentItem:BText{
                    text: qsTr("All emails go here.")
                }
            }
            BPivotItem{
                title: qsTr("Unread")
                contentItem: BText{
                    text: qsTr("Unread emails go here.")
                }
            }
            BPivotItem{
                title: qsTr("Flagged")
                contentItem: BText{
                    text: qsTr("Flagged emails go here.")
                }
            }
            BPivotItem{
                title: qsTr("Urgent")
                contentItem: BText{
                    text: qsTr("Urgent emails go here.")
                }
            }
        }
    }
    CodeExpander{
        Layout.fillWidth: true
        Layout.topMargin: -6
        code:'BPivot{
    anchors.fill: parent
    BPivotItem:{
        text: qsTr("All")
        contentItem: BText{
            text: qsTr("All emails go here.")
        }
    }
    BPivotItem:{
        text: qsTr("Unread")
        contentItem: BText{
            text: qsTr("Unread emails go here.")
        }
    }
    BPivotItem:{
        text: qsTr("Flagged")
        contentItem: BText{
            text: qsTr("Flagged emails go here.")
        }
    }
    BPivotItem:{
        text: qsTr("Urgent")
        contentItem: BText{
            text: qsTr("Urgent emails go here.")
        }
    }
}
'
    }
}
