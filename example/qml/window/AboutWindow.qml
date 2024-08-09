import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import BeautyUI 1.0
import "../component"

BWindow {

    id:window
    title:"关于"
    width: 600
    height: 580
    fixSize: true
    launchMode: BWindowType.SingleTask

    ColumnLayout{
        anchors{
            top: parent.top
            left: parent.left
            right: parent.right
        }
        spacing: 5

        RowLayout{
            Layout.topMargin: 10
            Layout.leftMargin: 15
            spacing: 14
            BText{
                text:"BeautyUI"
                font: BTextStyle.Title
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        BRouter.navigate("/")
                    }
                }
            }
            BText{
                text:"v%1".arg(AppInfo.version)
                font: BTextStyle.Body
                Layout.alignment: Qt.AlignBottom
            }
        }

        RowLayout{
            spacing: 14
            Layout.leftMargin: 15
            BText{
                text:"作者："
            }
            BText{
                text:"beautyui"
                Layout.alignment: Qt.AlignBottom
            }
        }

        RowLayout{
            spacing: 14
            Layout.leftMargin: 15
            BText{
                text:"微信号："
            }
            BText{
                text:"BeautyUI"
                Layout.alignment: Qt.AlignBottom
            }
            BText{
                text:"(有啥问题可能不会马上回，但发了红包必须立马回......)"
            }
        }

        RowLayout{
            spacing: 14
            Layout.leftMargin: 15
            BText{
                text:"GitHub："
            }
            BTextButton{
                id:text_hublink
                topPadding:0
                bottomPadding:0
                text:""
                Layout.alignment: Qt.AlignBottom
                onClicked: {
                    Qt.openUrlExternally(text_hublink.text)
                }
            }
        }

        RowLayout{
            spacing: 14
            Layout.leftMargin: 15
            BText{
                text:"B站："
            }
            BTextButton{
                topPadding:0
                bottomPadding:0
                text:""
                Layout.alignment: Qt.AlignBottom
                onClicked: {
                    Qt.openUrlExternally(text)
                }
            }
        }

        RowLayout{
            spacing: 14
            Layout.leftMargin: 15
            BText{
                id:text_info
                text:"如果该项目对你有作用，就请点击上方链接给一个免费的star，或者一键三连，谢谢！"
                ColorAnimation {
                    id: animation
                    target: text_info
                    property: "color"
                    from: "red"
                    to: "blue"
                    duration: 1000
                    running: true
                    loops: Animation.Infinite
                    easing.type: Easing.InOutQuad
                }
            }
        }

        RowLayout{
            spacing: 14
            Layout.topMargin: 20
            Layout.leftMargin: 15
            BText{
                text:"捐赠："
            }
        }

        Item{
            Layout.preferredWidth: parent.width
            Layout.preferredHeight: 252
            Row{
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 30
                Image{
                    width: 250
                    height: 250
                    source: ""
                }
                Image{
                    width: 250
                    height: 250
                    source: ""
                }
            }
        }

        RowLayout{
            spacing: 14
            Layout.leftMargin: 15
            Layout.topMargin: 20
            BText{
                id:text_desc
                text:""
            }
        }
    }
}
