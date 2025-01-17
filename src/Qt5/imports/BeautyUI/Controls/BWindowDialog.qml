import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import BeautyUI 1.0

BWindow {
    id:control
    property Component contentDelegate
    autoVisible: false
    autoCenter: false
    autoDestroy: true
    fixSize: true
    Loader{
        anchors.fill: parent
        sourceComponent: {
            if(control.autoDestroy){
                return control.visible ? control.contentDelegate : undefined
            }
            return control.contentDelegate
        }
    }
    closeListener: function(event){
        control.visibility = Window.Hidden
        event.accepted = false
    }
    Connections{
        target: control.transientParent
        function onVisibilityChanged(){
            if(control.transientParent.visibility === Window.Hidden){
                control.visibility = Window.Hidden
            }
        }
    }
    function showDialog(offsetX=0,offsetY=0){
        var x = transientParent.x + (transientParent.width - width)/2 + offsetX
        var y = transientParent.y + (transientParent.height - height)/2 + offsetY
        control.stayTop = Qt.binding(function(){return transientParent.stayTop})
        control.setGeometry(x,y,width,height)
        control.visibility = Window.Windowed
    }
}
