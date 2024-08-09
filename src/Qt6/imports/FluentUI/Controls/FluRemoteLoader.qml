import QtQuick
import QtQuick.Controls
import BeautyUI

BStatusLayout {
    property url source: ""
    property bool lazy: false
    color:"transparent"
    id:control
    onErrorClicked: {
        reload()
    }
    Component.onCompleted: {
        if(!lazy){
            loader.source = control.source
        }
    }
    BLoader{
        id:loader
        anchors.fill: parent
        asynchronous: true
        onStatusChanged: {
            if(status === Loader.Error){
                control.statusMode = BStatusLayoutType.Error
            }else if(status === Loader.Loading){
                control.statusMode = BStatusLayoutType.Loading
            }else{
                control.statusMode = BStatusLayoutType.Success
            }
        }
    }
    function reload(){
        var timestamp = Date.now();
        loader.source = control.source+"?"+timestamp
    }
    function itemLodaer(){
        return loader
    }
}
