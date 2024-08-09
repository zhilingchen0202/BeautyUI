import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import BeautyUI 1.0
import "../component"

BScrollablePage{

    title: qsTr("Timeline")

    Component{
        id:com_dot
        Rectangle{
            width: 16
            height: 16
            radius: 8
            border.width: 4
            border.color: BTheme.dark ? BColors.Teal.lighter : BColors.Teal.dark
        }
    }

    Component{
        id:com_lable
        BText{
            wrapMode: Text.WrapAnywhere
            font.bold: true
            horizontalAlignment: isRight ? Qt.AlignRight : Qt.AlignLeft
            text: modelData.lable
            color: BTheme.dark ? BColors.Teal.lighter : BColors.Teal.dark
            MouseArea{
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: {
                    showSuccess(modelData.lable)
                }
            }
        }
    }

    Component{
        id:com_text
        BText{
            wrapMode: Text.WrapAnywhere
            horizontalAlignment: isRight ? Qt.AlignRight : Qt.AlignLeft
            text: modelData.text
            linkColor: BTheme.dark ? BColors.Teal.lighter : BColors.Teal.dark
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
        }
    }

    ListModel{
        id:list_model
        ListElement{
            lable:"2013-09-01"
            text:'&nbsp;<img src="qrc:/example/res/image/image_1.jpg" align="top" width="144" height="102.4">&nbsp;考上中国皮城大学，杰斯武器工坊专业'
        }
        ListElement{
            lable:"2017-07-01"
            text:"大学毕业，在寝室打了4年LOL，没想到毕业还要找工作，瞬间蒙蔽，害"
        }
        ListElement{
            lable:"2017-09-01"
            text:"开始找工作，毕业即失业！回农村老家躺平，继承三亩良田"
        }
        ListElement{
            lable:"2018-02-01"
            text:"玩了一年没钱，惨，出去找工作上班"
        }
        ListElement{
            lable:"2018-03-01"
            text:"找到一份Android外包开发岗位，开发了一个Android应用，满满成就感！前端、服务端、Btter也都懂一丢丢，什么都会什么都不精通，钱途无望"
        }
        ListElement{
            lable:"2021-06-01"
            text:"由于某个项目紧急，临时加入Qt项目组（就因为大学学了点C++），本来是想进去打个酱油，到后面竟然成开发主力，坑啊"
        }
        ListElement{
            lable:"2022-08-01"
            text:"额，被老板卖到甲方公司，走时老板还问我想不想去，我说：'哪里工资高就去哪里'，老板：'无语'"
        }
        ListElement{
            lable:"2023-02-28"
            text:"开发BeautyUI组件库"
        }
        ListElement{
            lable:"2023-03-28"
            text:''
            lableDelegate:()=>com_lable
            textDelegate:()=>com_text
            dot:()=>com_dot
        }
    }

    RowLayout{
        spacing: 20
        BTextBox{
            id: text_box
            text: "Technical testing 2015-09-01"
            Layout.preferredWidth: 240
        }
        BFilledButton{
            text: qsTr("Append")
            onClicked: {
                list_model.append({text:text_box.text})
            }
        }
        BFilledButton{
            text: qsTr("clear")
            onClicked: {
                list_model.clear()
            }
        }
    }

    RowLayout{
        Layout.topMargin: 10
        BText{
            text:"mode:"
        }
        BDropDownButton{
            id: btn_mode
            Layout.preferredWidth: 100
            text: "Alternate"
            BMenuItem{
                text: "Left"
                onClicked: {
                    btn_mode.text = text
                    time_line.mode = BTimelineType.Left
                }
            }
            BMenuItem{
                text: "Right"
                onClicked: {
                    btn_mode.text = text
                    time_line.mode = BTimelineType.Right
                }
            }
            BMenuItem{
                text: "Alternate"
                onClicked: {
                    btn_mode.text = text
                    time_line.mode = BTimelineType.Alternate
                }
            }
        }
    }

    BTimeline{
        id: time_line
        Layout.fillWidth: true
        Layout.topMargin: 20
        Layout.bottomMargin: 20
        mode: BTimelineType.Alternate
        model: list_model
    }

}
