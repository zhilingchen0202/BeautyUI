pragma Singleton

import QtQuick 2.15
import BeautyUI 1.0

BObject{

    property var navigationView
    property var paneItemMenu

    id:footer_items

    BPaneItemSeparator{}

    BPaneItem{
        title:qsTr("About")
        icon:BeautyIcons.Contact
        onTapListener:function(){
            BRouter.navigate("/about")
        }
    }

    BPaneItem{
        title:qsTr("Settings")
        menuDelegate: paneItemMenu
        icon:BeautyIcons.Settings
        url:"qrc:/example/qml/page/T_Settings.qml"
        onTap:{
            navigationView.push(url)
        }
    }

    BPaneItem{
        title:qsTr("BeautyUI Pro")
        menuDelegate: paneItemMenu
        icon: BeautyIcons.Airplane
        url:"qrc:/example/qml/page/T_BeautyPro.qml"
        onTap:{
            navigationView.push(url)
        }
    }
}
