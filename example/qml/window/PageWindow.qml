import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import BeautyUI 1.0
import example 1.0
import "../component"

BWindow {

    id:window
    width: 800
    height: 600
    minimumWidth: 520
    minimumHeight: 200
    launchMode: BWindowType.SingleInstance
    onInitArgument:
        (arg)=>{
            window.title = arg.title
            loader.setSource(arg.url,{animationEnabled:false})
        }
    BLoader{
        id: loader
        anchors.fill: parent
    }
}
