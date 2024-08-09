import QtQuick
import QtQuick.Controls
import Qt5Compat.GraphicalEffects
import BeautyUI

BRectangle {
    id:control
    color: "#00000000"
    layer.enabled: !BTools.isSoftware()
    layer.textureSize: Qt.size(control.width*2*Math.ceil(Screen.devicePixelRatio),control.height*2*Math.ceil(Screen.devicePixelRatio))
    layer.effect: OpacityMask{
        maskSource: ShaderEffectSource{
            sourceItem: BRectangle{
                radius: control.radius
                width: control.width
                height: control.height
            }
        }
    }
}
