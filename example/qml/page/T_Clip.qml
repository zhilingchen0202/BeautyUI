import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
import BeautyUI 1.0
import "../component"

BScrollablePage{

    title: qsTr("Clip")

    BFrame{
        Layout.fillWidth: true
        Layout.preferredHeight: 380
        padding: 10

        Column{
            spacing: 15
            anchors{
                verticalCenter: parent.verticalCenter
                left: parent.left
            }
            BText{
                text: qsTr("Use with images (this component will have no effect under software rendering)")
                Layout.topMargin: 20
            }
            RowLayout{
                spacing: 14
                BClip{
                    width: 50
                    height: 50
                    radius: [25,0,25,25]
                    Image {
                        asynchronous: true
                        anchors.fill: parent
                        source: "qrc:/example/res/svg/avatar_1.svg"
                        sourceSize: Qt.size(width,height)
                    }
                }
                BClip{
                    width: 50
                    height: 50
                    radius: [10,10,10,10]
                    Image {
                        asynchronous: true
                        anchors.fill: parent
                        sourceSize: Qt.size(width,height)
                        source: "qrc:/example/res/svg/avatar_2.svg"
                    }
                }
                BClip{
                    width: 50
                    height: 50
                    radius: [25,25,25,25]
                    Image {
                        asynchronous: true
                        anchors.fill: parent
                        sourceSize: Qt.size(width,height)
                        source: "qrc:/example/res/svg/avatar_3.svg"
                    }
                }
                BClip{
                    width: 50
                    height: 50
                    radius: [0,25,25,25]
                    Image {
                        asynchronous: true
                        anchors.fill: parent
                        sourceSize: Qt.size(width,height)
                        source: "qrc:/example/res/svg/avatar_4.svg"
                    }
                }
            }
            BClip{
                width: 1920/5
                height: 1200/5
                radius: [8,8,8,8]
                Image {
                    asynchronous: true
                    source: "qrc:/example/res/image/banner_1.jpg"
                    anchors.fill: parent
                    sourceSize: Qt.size(2*width,2*height)
                }
                Layout.topMargin: 20
            }
        }
    }
    CodeExpander{
        Layout.fillWidth: true
        Layout.topMargin: -6
        code:'BClip{
    radius: [25,25,25,25]
    width: 50
    height: 50
    Image{
        asynchronous: true
        anchors.fill: parent
        source: "qrc:/example/res/svg/avatar_4.svg"
        sourceSize: Qt.size(width,height)
    }
}'
    }


}
