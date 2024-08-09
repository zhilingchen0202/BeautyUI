import QtQuick 2.15
import QtQuick.Controls 2.15
import BeautyUI 1.0

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
