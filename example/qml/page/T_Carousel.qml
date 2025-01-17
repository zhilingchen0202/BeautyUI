import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import BeautyUI 1.0
import "../component"

BScrollablePage{

    title: qsTr("Carousel")

    ListModel{
        id:data_model
        ListElement{
            url:"qrc:/example/res/image/banner_1.jpg"
        }
        ListElement{
            url:"qrc:/example/res/image/banner_2.jpg"
        }
        ListElement{
            url:"qrc:/example/res/image/banner_3.jpg"
        }
    }

    BFrame{
        Layout.fillWidth: true
        height: 370
        padding: 10
        Column{
            spacing: 15
            anchors{
                verticalCenter: parent.verticalCenter
                left:parent.left
            }
            BText{
                text: qsTr("Carousel map, support infinite carousel, infinite swipe, and components implemented with ListView")
            }
            Item{
                width: 400
                height: 300
                BShadow{
                    radius: 8
                }
                BCarousel{
                    anchors.fill: parent
                    delegate: Component{
                        Image {
                            anchors.fill: parent
                            source: model.url
                            asynchronous: true
                            fillMode:Image.PreserveAspectCrop
                        }
                    }
                    Layout.topMargin: 20
                    Layout.leftMargin: 5
                    Component.onCompleted: {
                        model = [{url:"qrc:/example/res/image/banner_1.jpg"},{url:"qrc:/example/res/image/banner_2.jpg"},{url:"qrc:/example/res/image/banner_3.jpg"}]
                    }
                }
            }
        }
    }

    BFrame{
        Layout.fillWidth: true
        height: 340
        padding: 10
        Layout.topMargin: 10
        Column{
            spacing: 15
            anchors{
                verticalCenter: parent.verticalCenter
                left:parent.left
            }
            Item{
                width: 400
                height: 300
                BShadow{
                    radius: 8
                }
                BCarousel{
                    anchors.fill: parent
                    loopTime:1500
                    indicatorGravity: Qt.AlignHCenter | Qt.AlignTop
                    indicatorMarginTop:15
                    delegate: Component{
                        Item{
                            anchors.fill: parent
                            Image {
                                anchors.fill: parent
                                source: model.url
                                asynchronous: true
                                fillMode:Image.PreserveAspectCrop
                            }
                            Rectangle{
                                height: 40
                                width: parent.width
                                anchors.bottom: parent.bottom
                                color: "#33000000"
                                BText{
                                    anchors.fill: parent
                                    verticalAlignment: Qt.AlignVCenter
                                    horizontalAlignment: Qt.AlignHCenter
                                    text:model.title
                                    color: BColors.Grey10
                                }
                            }
                        }
                    }
                    Layout.topMargin: 20
                    Layout.leftMargin: 5
                    Component.onCompleted: {
                        var arr = []
                        arr.push({url:"qrc:/example/res/image/banner_1.jpg",title:"共同应对全球性问题"})
                        arr.push({url:"qrc:/example/res/image/banner_2.jpg",title:"三小只全程没互动"})
                        arr.push({url:"qrc:/example/res/image/banner_3.jpg",title:"有效投资扩大 激发增长动能"})
                        model = arr
                    }
                }
            }

        }
    }

    CodeExpander{
        Layout.fillWidth: true
        Layout.topMargin: -6
        code:'BCarousel{
    id:carousel
    width: 400
    height: 300
    delegate: Component{
        Image {
            anchors.fill: parent
            source: model.url
            asynchronous: true
            fillMode:Image.PreserveAspectCrop
        }
    }
    Component.onCompleted: {
        carousel.model = [{url:"qrc:/example/res/image/banner_1.jpg"},{url:"qrc:/example/res/image/banner_2.jpg"},{url:"qrc:/example/res/image/banner_3.jpg"}]
    }
}'
    }
}
