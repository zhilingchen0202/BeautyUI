import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import BeautyUI 1.0
import "../component"

BScrollablePage{

    title: qsTr("FlipView")

    BFrame{
        Layout.fillWidth: true
        Layout.preferredHeight: 340
        padding: 10
        ColumnLayout{
            anchors.verticalCenter: parent.verticalCenter
            BText{
                text: qsTr("Horizontal FlipView")
            }
            BFlipView{
                Image{
                    source: "qrc:/example/res/image/banner_1.jpg"
                    asynchronous: true
                    fillMode:Image.PreserveAspectCrop
                }
                Image{
                    source: "qrc:/example/res/image/banner_2.jpg"
                    asynchronous: true
                    fillMode:Image.PreserveAspectCrop
                }
                Image{
                    source: "qrc:/example/res/image/banner_3.jpg"
                    asynchronous: true
                    fillMode:Image.PreserveAspectCrop
                }
            }
        }
    }
    CodeExpander{
        Layout.fillWidth: true
        Layout.topMargin: -6
        code:'BFlipView{
    Image{
        source: "qrc:/example/res/image/banner_1.jpg"
        asynchronous: true
        fillMode:Image.PreserveAspectCrop
    }
    Image{
        source: "qrc:/example/res/image/banner_1.jpg"
        asynchronous: true
        fillMode:Image.PreserveAspectCrop
    }
    Image{
        source: "qrc:/example/res/image/banner_1.jpg"
        asynchronous: true
        fillMode:Image.PreserveAspectCrop
    }
}
'
    }

    BFrame{
        Layout.fillWidth: true
        height: 340
        padding: 10
        Layout.topMargin: 20
        ColumnLayout{
            anchors.verticalCenter: parent.verticalCenter
            BText{
                text: qsTr("Vertical FlipView")
            }
            BFlipView{
                vertical:true
                Image{
                    source: "qrc:/example/res/image/banner_1.jpg"
                    asynchronous: true
                    fillMode:Image.PreserveAspectCrop
                }
                Image{
                    source: "qrc:/example/res/image/banner_2.jpg"
                    asynchronous: true
                    fillMode:Image.PreserveAspectCrop
                }
                Image{
                    source: "qrc:/example/res/image/banner_3.jpg"
                    asynchronous: true
                    fillMode:Image.PreserveAspectCrop
                }
            }
        }
    }
    CodeExpander{
        Layout.fillWidth: true
        Layout.topMargin: -6
        code:'BFlipView{
    vertical:true
    Image{
        source: "qrc:/example/res/image/banner_1.jpg"
        asynchronous: true
        fillMode:Image.PreserveAspectCrop
    }
    Image{
        source: "qrc:/example/res/image/banner_1.jpg"
        asynchronous: true
        fillMode:Image.PreserveAspectCrop
    }
    Image{
        source: "qrc:/example/res/image/banner_1.jpg"
        asynchronous: true
        fillMode:Image.PreserveAspectCrop
    }
}
'
    }
}
