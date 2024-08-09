import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import BeautyUI 1.0
import "../component"

BScrollablePage{

    title: qsTr("Text")

    BFrame{
        Layout.fillWidth: true
        Layout.preferredHeight: 60
        padding: 10

        BCopyableText{
            text: qsTr("This is a text that can be copied")
            anchors.verticalCenter: parent.verticalCenter
        }

    }
    CodeExpander{
        Layout.fillWidth: true
        Layout.topMargin: -6
        code:'BCopyableText{
    text: qsTr("This is a text that can be copied")
}'
    }

}
