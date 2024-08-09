import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import "../component"
import BeautyUI 1.0

BScrollablePage{

    title: qsTr("Pagination")

    BFrame{
        Layout.fillWidth: true
        Layout.preferredHeight: 200
        padding: 10
        ColumnLayout{
            spacing: 20
            anchors.verticalCenter: parent.verticalCenter
            BPagination{
                pageCurrent: 1
                pageButtonCount: 5
                itemCount: 5000
            }
            BPagination{
                pageCurrent: 2
                itemCount: 5000
                pageButtonCount: 7
            }
            BPagination{
                pageCurrent: 3
                itemCount: 5000
                pageButtonCount: 9
            }
        }

    }
    CodeExpander{
        Layout.fillWidth: true
        Layout.topMargin: -6
        code:'BPagination{
    pageCurrent: 1
    itemCount: 1000
    pageButtonCount: 9
}'
    }


}
