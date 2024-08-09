import QtQuick
import QtQuick.Controls
import BeautyUI

QtObject {
    id:control
    property string name
    signal triggered(var data)
    Component.onCompleted: {
        BEventBus.register(control)
    }
    Component.onDestruction: {
        BEventBus.unregister(control)
    }
}
