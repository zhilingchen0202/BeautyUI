import QtQuick 2.15
import QtQuick.Window 2.15
import BeautyUI 1.0

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
