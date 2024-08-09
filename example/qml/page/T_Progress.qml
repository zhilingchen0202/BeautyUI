import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import BeautyUI 1.0
import "../component"

BScrollablePage{

    title: qsTr("Progress")

    BFrame{
        Layout.fillWidth: true
        Layout.preferredHeight: 130
        padding: 10

        ColumnLayout{
            spacing: 10
            anchors{
                verticalCenter: parent.verticalCenter
                left: parent.left
            }
            BText{
                text: "indeterminate = true"
            }
            BProgressBar{
            }
            BProgressRing{
            }
        }
    }
    CodeExpander{
        Layout.fillWidth: true
        Layout.topMargin: -6
        code:'BProgressBar{

}
BProgressRing{

}
'
    }

    BFrame{
        Layout.fillWidth: true
        Layout.topMargin: 20
        Layout.preferredHeight: 286
        padding: 10

        ColumnLayout{
            spacing: 10
            anchors{
                verticalCenter: parent.verticalCenter
                left: parent.left
            }
            BText{
                text: "indeterminate = false"
            }
            BProgressBar{
                indeterminate: false
                value:slider.value/100
                Layout.topMargin: 10
            }
            BProgressBar{
                indeterminate: false
                value:slider.value/100
                progressVisible: true
                Layout.topMargin: 10
            }
            BProgressRing{
                indeterminate: false
                value: slider.value/100
                Layout.topMargin: 10
            }
            BProgressRing{
                progressVisible: true
                indeterminate: false
                value: slider.value/100
            }
            BSlider{
                id:slider
                Component.onCompleted: {
                    value = 50
                }
            }
        }
    }
    CodeExpander{
        Layout.fillWidth: true
        Layout.topMargin: -6
        code:'BProgressBar{
    indeterminate: false
}
BProgressRing{
    indeterminate: false
    progressVisible: true
}
'
    }


}
