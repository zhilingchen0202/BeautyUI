import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
import BeautyUI 1.0

Popup {
    id: control
    padding: 0
    modal:true
    parent: Overlay.overlay
    x: Math.round((d.parentWidth - width) / 2)
    y: Math.round((d.parentHeight - height) / 2)
    closePolicy: Popup.NoAutoClose
    enter: Transition {
        NumberAnimation {
            property: "opacity"
            duration: BTheme.animationEnabled ? 83 : 0
            from:0
            to:1
        }
    }
    height:Math.min(implicitHeight,d.parentHeight)
    exit:Transition {
        NumberAnimation {
            property: "opacity"
            duration: BTheme.animationEnabled ? 83 : 0
            from:1
            to:0
        }
    }
    background: BRectangle{
        radius: [5,5,5,5]
        color: BTheme.dark ? Qt.rgba(43/255,43/255,43/255,1) : Qt.rgba(1,1,1,1)
        BShadow{
            radius: 5
        }
    }
    QtObject{
        id:d
        property int parentHeight: {
            if(control.parent){
                return control.parent.height
            }
            return control.height
        }
        property int parentWidth: {
            if(control.parent){
                return control.parent.width
            }
            return control.width
        }
    }
}
