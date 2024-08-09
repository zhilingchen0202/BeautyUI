import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import BeautyUI 1.0
import "../component"

BScrollablePage{

    title: qsTr("Slider")

    BFrame{
        Layout.fillWidth: true
        Layout.preferredHeight: 200
        padding: 10

        Row{
            spacing: 30
            BSlider{
            }
            BSlider{
                orientation: Qt.Vertical
                anchors.verticalCenter: parent.verticalCenter
            }
        }
    }
    CodeExpander{
        Layout.fillWidth: true
        Layout.topMargin: -6
        code:'BSlider{
    value:50
}'
    }


    BFrame{
        Layout.fillWidth: true
        Layout.preferredHeight: 200
        Layout.topMargin: 20
        padding: 10
        Row{
            spacing: 30
            BRangeSlider{
            }
            BRangeSlider{
                orientation: Qt.Vertical
                anchors.verticalCenter: parent.verticalCenter
            }
        }
    }
    CodeExpander{
        Layout.fillWidth: true
        Layout.topMargin: -6
        code:'BRangeSlider{
    orientation: Qt.Vertical
}'
    }
}

