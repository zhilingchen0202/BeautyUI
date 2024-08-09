import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import BeautyUI 1.0
import "../window"
import "../global"

BScrollablePage{

    launchMode: BPageType.SingleTask
    animationEnabled: false
    header: Item{}

    ListModel{
        id: model_header
        ListElement{
            icon: "qrc:/example/res/image/logo_pro.png"
            title: qsTr("beautyui Pro")
            desc: qsTr("The latest BeautyUI Pro controls and styles for your applications.")
            url: ""
            clicked: function(model){
                Qt.openUrlExternally(model.url)
            }
        }
        ListElement{
            icon: "qrc:/example/res/image/ic_home_github.png"
            title: qsTr("beautyui GitHub")
            desc: qsTr("The latest beautyui controls and styles for your applications.")
            url: ""
            clicked: function(model){
                Qt.openUrlExternally(model.url)
            }
        }
        ListElement{
            icon: "qrc:/example/res/image/favicon.ico"
            title: qsTr("beautyui Initializr")
            desc: qsTr("beautyui Initializr is a Tool that helps you create and customize beautyui projects with various options.")
            url: ""
            clicked: function(model){
                beautyInitializr.showDialog()
            }
        }
    }
    Item{
        Layout.fillWidth: true
        Layout.preferredHeight: 320
        Image {
            id: bg
            fillMode:Image.PreserveAspectCrop
            anchors.fill: parent
            verticalAlignment: Qt.AlignTop
            sourceSize: Qt.size(960,640)
            source: "qrc:/example/res/image/bg_home_header.png"
        }
        Rectangle{
            anchors.fill: parent
            gradient: Gradient{
                GradientStop { position: 0.8; color: BTheme.dark ? Qt.rgba(0,0,0,0) : Qt.rgba(1,1,1,0) }
                GradientStop { position: 1.0; color: BTheme.dark ? Qt.rgba(0,0,0,1) : Qt.rgba(1,1,1,1) }
            }
        }
        BText{
            text:"BeautyUI Gallery"
            font: BTextStyle.TitleLarge
            anchors{
                top: parent.top
                left: parent.left
                topMargin: 20
                leftMargin: 20
            }
        }
        Component{
            id:com_grallery
            Item{
                id: control
                width: 220
                height: 240
                BShadow{
                    radius:5
                    anchors.fill: item_content
                }
                BClip{
                    id:item_content
                    radius: [5,5,5,5]
                    width: 200
                    height: 220
                    anchors.centerIn: parent
                    BAcrylic{
                        anchors.fill: parent
                        tintColor: BTheme.dark ? Qt.rgba(0,0,0,1) : Qt.rgba(1,1,1,1)
                        target: bg
                        tintOpacity: BTheme.dark ? 0.8 : 0.9
                        blurRadius : 40
                        targetRect: Qt.rect(list.x-list.contentX+10+(control.width)*index,list.y+10,width,height)
                    }
                    Rectangle{
                        anchors.fill: parent
                        radius: 5
                        color:BTheme.itemHoverColor
                        visible: item_mouse.containsMouse
                    }
                    Rectangle{
                        anchors.fill: parent
                        radius: 5
                        color:Qt.rgba(0,0,0,0.0)
                        visible: !item_mouse.containsMouse
                    }
                    ColumnLayout{
                        Image {
                            Layout.topMargin: 20
                            Layout.leftMargin: 20
                            Layout.preferredWidth: 50
                            Layout.preferredHeight: 50
                            source: model.icon
                        }
                        BText{
                            text: model.title
                            font: BTextStyle.Body
                            Layout.topMargin: 20
                            Layout.leftMargin: 20
                        }
                        BText{
                            text: model.desc
                            Layout.topMargin: 5
                            Layout.preferredWidth: 160
                            Layout.leftMargin: 20
                            color: BColors.Grey120
                            font.pixelSize: 12
                            font.family: BTextStyle.family
                            wrapMode: Text.WrapAnywhere
                        }
                    }
                    BIcon{
                        iconSource: BeautyIcons.OpenInNewWindow
                        iconSize: 15
                        anchors{
                            bottom: parent.bottom
                            right: parent.right
                            rightMargin: 10
                            bottomMargin: 10
                        }
                    }
                    MouseArea{
                        id:item_mouse
                        anchors.fill: parent
                        hoverEnabled: true
                        onWheel:
                            (wheel)=>{
                                if (wheel.angleDelta.y > 0) scrollbar_header.decrease()
                                else scrollbar_header.increase()
                            }
                        onClicked: {
                            model.clicked(model)
                        }
                    }
                }
            }
        }

        ListView{
            id: list
            anchors{
                left: parent.left
                right: parent.right
                bottom: parent.bottom
            }
            orientation: ListView.Horizontal
            height: 240
            model: model_header
            header: Item{height: 10;width: 10}
            footer: Item{height: 10;width: 10}
            ScrollBar.horizontal: BScrollBar{
                id: scrollbar_header
            }
            clip: false
            delegate: com_grallery
        }
    }

    Component{
        id:com_item
        Item{
            property string desc: modelData.extra.desc
            width: 320
            height: 120
            BFrame{
                radius: 8
                width: 300
                height: 100
                anchors.centerIn: parent
                Rectangle{
                    anchors.fill: parent
                    radius: 8
                    color:{
                        if(item_mouse.containsMouse){
                            return BTheme.itemHoverColor
                        }
                        return BTheme.itemNormalColor
                    }
                }
                Image{
                    id:item_icon
                    height: 40
                    width: 40
                    source: modelData.extra.image
                    anchors{
                        left: parent.left
                        leftMargin: 20
                        verticalCenter: parent.verticalCenter
                    }
                }
                BText{
                    id:item_title
                    text:modelData.title
                    font: BTextStyle.BodyStrong
                    anchors{
                        left: item_icon.right
                        leftMargin: 20
                        top: item_icon.top
                    }
                }
                BText{
                    id:item_desc
                    text:desc
                    color:BColors.Grey120
                    wrapMode: Text.WrapAnywhere
                    elide: Text.ElideRight
                    font: BTextStyle.Caption
                    maximumLineCount: 2
                    anchors{
                        left: item_title.left
                        right: parent.right
                        rightMargin: 20
                        top: item_title.bottom
                        topMargin: 5
                    }
                }

                Rectangle{
                    height: 12
                    width: 12
                    radius:  6
                    color: BTheme.primaryColor
                    anchors{
                        right: parent.right
                        top: parent.top
                        rightMargin: 14
                        topMargin: 14
                    }
                }

                MouseArea{
                    id:item_mouse
                    anchors.fill: parent
                    hoverEnabled: true
                    onClicked: {
                        ItemsOriginal.startPageByItem(modelData)
                    }
                }
            }
        }
    }

    BText{
        text: "Recently added samples"
        font: BTextStyle.Title
        Layout.topMargin: 20
        Layout.leftMargin: 20
    }

    GridView{
        Layout.fillWidth: true
        Layout.preferredHeight: contentHeight
        cellHeight: 120
        cellWidth: 320
        model:ItemsOriginal.getRecentlyAddedData()
        interactive: false
        delegate: com_item
    }

    BText{
        text: "Recently updated samples"
        font: BTextStyle.Title
        Layout.topMargin: 20
        Layout.leftMargin: 20
    }

    GridView{
        Layout.fillWidth: true
        Layout.preferredHeight: contentHeight
        cellHeight: 120
        cellWidth: 320
        interactive: false
        model: ItemsOriginal.getRecentlyUpdatedData()
        delegate: com_item
    }

}

