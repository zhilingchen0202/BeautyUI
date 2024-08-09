import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import BeautyUI 1.0
import "../component"

BPage{
    launchMode: BPageType.SingleTop
    BRemoteLoader{
        anchors.fill: parent
        source: ""
    }
}
