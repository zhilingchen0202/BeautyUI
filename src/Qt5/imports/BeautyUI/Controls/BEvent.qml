import QtQuick 2.15
import QtQuick.Controls 2.15
import BeautyUI 1.0

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
