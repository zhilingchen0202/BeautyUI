import QtQuick
import QtQuick.Controls
import BeautyUI

QtObject {
    property string key
    property int _idx
    property bool visible: true
    property string title
    property var parent
    Component.onCompleted: {
        key = BTools.uuid()
    }
}
