import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import BeautyUI 1.0
import "../component"

BScrollablePage {

    title: qsTr("RatingControl")

    BFrame {
        Layout.fillWidth: true
        Layout.preferredHeight: 100
        padding: 10

        Column {
            spacing: 10
            anchors.verticalCenter: parent.verticalCenter
            BRatingControl {}
            BRatingControl {
                number: 10
            }
        }
    }

    CodeExpander {
        Layout.fillWidth: true
        Layout.topMargin: -6
        code: 'BRatingControl{

}'
    }
}
