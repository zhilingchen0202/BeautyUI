import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import BeautyUI 1.0
import "../component"

BScrollablePage{

    title: qsTr("Image")

    BFrame{
        Layout.fillWidth: true
        Layout.preferredHeight: 260
        padding: 10
        Column{
            spacing: 15
            anchors{
                verticalCenter: parent.verticalCenter
                left:parent.left
            }
            BImage{
                width: 384
                height: 240
                source: ""
                onStatusChanged:{
                    if(status === Image.Error){
                        showError(qsTr("The image failed to load, please reload"))
                    }
                }
                clickErrorListener: function(){
                    source = ""
                }
            }
        }
    }
    CodeExpander{
        Layout.fillWidth: true
        Layout.topMargin: -6
        code:'BImage{
    width: 400
    height: 300
    source: ""
}'
    }

}
