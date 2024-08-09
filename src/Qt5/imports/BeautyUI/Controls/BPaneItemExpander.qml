import QtQuick 2.15
import QtQuick.Controls 2.15
import BeautyUI 1.0

BObject {
    property string key
    property int _idx
    property bool visible: true
    property string title
    property var icon
    property bool disabled: false
    property bool iconVisible: true
    property bool isExpand: false
    property bool showEdit
    property Component iconDelegate
    property Component menuDelegate
    property Component editDelegate
    Component.onCompleted: {
        key = BTools.uuid()
    }
}
