import QtQuick
import BeautyUI

Item {

    id:control
    property var _from : Window.window
    property var _to
    property var path
    signal result(var data)

    function launch(argument = {}){
        BRouter.navigate(control.path,argument,control)
    }

    function setResult(data = {}){
        control.result(data)
    }

}
