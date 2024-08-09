import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import BeautyUI 1.0
import "../component"

BScrollablePage{

    title: qsTr("Tour")

    BTour{
        id:tour
        steps:[
            {title:qsTr("Upload File"),description: qsTr("Put your files here."),target:()=>btn_upload},
            {title:qsTr("Save"),description: qsTr("Save your changes."),target:()=>btn_save},
            {title:qsTr("Other Actions"),description: qsTr("Click to see other actions."),target:()=>btn_more}
        ]
    }

    BFrame{
        Layout.fillWidth: true
        Layout.preferredHeight: 130
        padding: 10

        BFilledButton{
            anchors{
                top: parent.top
                topMargin: 14
            }
            text: qsTr("Begin Tour")
            onClicked: {
                tour.open()
            }
        }

        Row{
            spacing: 20
            anchors{
                top: parent.top
                topMargin: 60
            }
            BButton{
                id: btn_upload
                text: qsTr("Upload")
                onClicked: {
                    showInfo(qsTr("Upload"))
                }
            }
            BFilledButton{
                id: btn_save
                text: qsTr("Save")
                onClicked: {
                    showInfo(qsTr("Save"))
                }
            }
            BIconButton{
                id: btn_more
                iconSource: BeautyIcons.More
                onClicked: {
                    showInfo(qsTr("More"))
                }
            }
        }
    }
    CodeExpander{
        Layout.fillWidth: true
        Layout.topMargin: -6
        code:'BTour{
    id:tour
    steps:[
        {title:"Upload File",description: "Put your files here.",target:()=>btn_upload},
        {title:"Save",description: "Save your changes.",target:()=>btn_save},
        {title:"Other Actions",description: "Click to see other actions.",target:()=>btn_more}
    ]
}'
    }

}
