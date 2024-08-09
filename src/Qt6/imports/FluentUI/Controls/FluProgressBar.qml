import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic
import BeautyUI

ProgressBar{
    property int duration: 888
    property real strokeWidth: 6
    property bool progressVisible: false
    property color color: BTheme.primaryColor
    property color backgroundColor : BTheme.dark ? Qt.rgba(99/255,99/255,99/255,1) : Qt.rgba(214/255,214/255,214/255,1)
    id:control
    indeterminate : true
    QtObject{
        id:d
        property real _radius: strokeWidth/2
    }
    onIndeterminateChanged:{
        if(!indeterminate){
            animator_x.duration = 0
            rect_progress.x = 0
            animator_x.duration = control.duration
        }
    }
    background: Rectangle {
        implicitWidth: 150
        implicitHeight: control.strokeWidth
        color: control.backgroundColor
        radius: d._radius
    }
    contentItem: BClip {
        clip: true
        radius: [d._radius,d._radius,d._radius,d._radius]
        Rectangle {
            id:rect_progress
            width: {
                if(control.indeterminate){
                    return 0.5 * parent.width
                }
                return control.visualPosition * parent.width
            }
            height: parent.height
            radius: d._radius
            color: control.color
            PropertyAnimation on x {
                id:animator_x
                running: control.indeterminate && control.visible
                from: -rect_progress.width
                to:control.width+rect_progress.width
                loops: Animation.Infinite
                duration: control.duration
            }
        }
    }
    BText{
        text:(control.visualPosition * 100).toFixed(0) + "%"
        visible: {
            if(control.indeterminate){
                return false
            }
            return control.progressVisible
        }
        anchors{
            left: parent.left
            leftMargin: control.width+5
            verticalCenter: parent.verticalCenter
        }
    }
}
