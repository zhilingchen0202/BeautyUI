import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import BeautyUI 1.0
import "../component"

BScrollablePage{

    property var colors : [BColors.Yellow,BColors.Orange,BColors.Red,BColors.Magenta,BColors.Purple,BColors.Blue,BColors.Teal,BColors.Green]

    title: qsTr("TabView")

    Component{
        id:com_page
        Rectangle{
            anchors.fill: parent
            color: argument.normal
        }
    }

    function newTab(){
        tab_view.appendTab("qrc:/example/res/image/favicon.ico",qsTr("Document ")+tab_view.count(),com_page,colors[Math.floor(Math.random() * 8)])
    }

    Component.onCompleted: {
        newTab()
        newTab()
        newTab()
    }

    BFrame{
        Layout.fillWidth: true
        Layout.preferredHeight: 50
        padding: 10
        RowLayout{
            spacing: 14
            BDropDownButton{
                id:btn_tab_width_behavior
                Layout.preferredWidth: 140
                text:"Equal"
                BMenuItem{
                    text:"Equal"
                    onClicked: {
                        btn_tab_width_behavior.text = text
                        tab_view.tabWidthBehavior = BTabViewType.Equal
                    }
                }
                BMenuItem{
                    text:"SizeToContent"
                    onClicked: {
                        btn_tab_width_behavior.text = text
                        tab_view.tabWidthBehavior = BTabViewType.SizeToContent
                    }
                }
                BMenuItem{
                    text:"Compact"
                    onClicked: {
                        btn_tab_width_behavior.text = text
                        tab_view.tabWidthBehavior = BTabViewType.Compact
                    }
                }
            }
            BDropDownButton{
                id:btn_close_button_visibility
                text:"Always"
                Layout.preferredWidth: 120
                BMenuItem{
                    text:"Never"
                    onClicked: {
                        btn_close_button_visibility.text = text
                        tab_view.closeButtonVisibility = BTabViewType.Never
                    }
                }
                BMenuItem{
                    text:"Always"
                    onClicked: {
                        btn_close_button_visibility.text = text
                        tab_view.closeButtonVisibility = BTabViewType.Always
                    }
                }
                BMenuItem{
                    text:"OnHover"
                    onClicked: {
                        btn_close_button_visibility.text = text
                        tab_view.closeButtonVisibility = BTabViewType.OnHover
                    }
                }
            }
        }
    }

    BFrame{
        Layout.fillWidth: true
        Layout.topMargin: 15
        Layout.preferredHeight: 400
        padding: 10
        BTabView{
            id:tab_view
            onNewPressed:{
                newTab()
            }
        }
    }
    CodeExpander{
        Layout.fillWidth: true
        Layout.topMargin: -6
        code:'BTabView{
    anchors.fill: parent
    Component.onCompleted: {
        newTab()
        newTab()
        newTab()
    }
    Component{
        id:com_page
        Rectangle{
            anchors.fill: parent
            color: argument
        }
    }
    function newTab(){
        tab_view.appendTab("qrc:/example/res/image/favicon.ico","Document 1",com_page,argument)
    }
}
'
    }
}
