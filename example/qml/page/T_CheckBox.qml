import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import BeautyUI 1.0
import "../component"

BScrollablePage{

    title: qsTr("CheckBox")

    BFrame{
        Layout.fillWidth: true
        Layout.preferredHeight: 72
        padding: 10

        BText{
            text: qsTr("A 2-state CheckBox")
        }

        Row{
            spacing: 30
            anchors{
                top: parent.top
                topMargin: 30
            }
            BCheckBox{
                disabled: check_box_switch_two.checked
            }
            BCheckBox{
                disabled: check_box_switch_two.checked
                text: qsTr("Right")
            }
            BCheckBox{
                disabled: check_box_switch_two.checked
                text: qsTr("Left")
                textRight: false
            }
        }
        BToggleSwitch{
            id:check_box_switch_two
            anchors{
                right: parent.right
                verticalCenter: parent.verticalCenter
            }
            text: qsTr("Disabled")
        }
    }
    CodeExpander{
        Layout.fillWidth: true
        Layout.topMargin: -6
        code:'BCheckBox{
    text:"Text"
}'
    }

    BFrame{
        Layout.fillWidth: true
        Layout.preferredHeight: 72
        padding: 10
        Layout.topMargin: 20

        BText{
            text: qsTr("A 3-state CheckBox")
        }

        Row{
            spacing: 30
            anchors{
                top: parent.top
                topMargin: 30
            }
            BCheckBox{
                property int count: 1
                text: qsTr("Three State")
                disabled: check_box_switch_three.checked
                clickListener: function(){
                    var flag = count%3
                    if(flag === 0){
                        checked = false
                        indeterminate = false
                    }
                    if(flag === 1){
                        checked = true
                        indeterminate = false
                    }
                    if(flag === 2){
                        checked = true
                        indeterminate = true
                    }
                    count++
                }
            }
        }
        BToggleSwitch{
            id:  check_box_switch_three
            anchors{
                right: parent.right
                verticalCenter: parent.verticalCenter
            }
            text: qsTr("Disabled")
        }
    }
    CodeExpander{
        Layout.fillWidth: true
        Layout.topMargin: -6
        code:'BCheckBox{
    text:"Text"
    indeterminate:true
}'
    }

}
