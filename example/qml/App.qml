import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import BeautyUI 1.0

BLauncher {
    id: app
    Connections{
        target: BTheme
        function onDarkModeChanged(){
            SettingsHelper.saveDarkMode(BTheme.darkMode)
        }
    }
    Connections{
        target: BApp
        function onUseSystemAppBarChanged(){
            SettingsHelper.saveUseSystemAppBar(BApp.useSystemAppBar)
        }
    }
    Connections{
        target: TranslateHelper
        function onCurrentChanged(){
            SettingsHelper.saveLanguage(TranslateHelper.current)
        }
    }
    Component.onCompleted: {
        Network.openLog = false
        Network.setInterceptor(function(param){
            param.addHeader("Token","000000000000000000000")
        })
        BApp.init(app,Qt.locale(TranslateHelper.current))
        BApp.windowIcon = "qrc:/example/res/image/favicon.ico"
        BApp.useSystemAppBar = SettingsHelper.getUseSystemAppBar()
        BTheme.darkMode = SettingsHelper.getDarkMode()
        BTheme.animationEnabled = true
        BRouter.routes = {
            "/":"qrc:/example/qml/window/MainWindow.qml",
            "/about":"qrc:/example/qml/window/AboutWindow.qml",
            "/login":"qrc:/example/qml/window/LoginWindow.qml",
            "/hotload":"qrc:/example/qml/window/HotloadWindow.qml",
            "/crash":"qrc:/example/qml/window/CrashWindow.qml",
            "/singleTaskWindow":"qrc:/example/qml/window/SingleTaskWindow.qml",
            "/standardWindow":"qrc:/example/qml/window/StandardWindow.qml",
            "/singleInstanceWindow":"qrc:/example/qml/window/SingleInstanceWindow.qml",
            "/pageWindow":"qrc:/example/qml/window/PageWindow.qml",
            "/hotkey":"qrc:/example/qml/window/HotkeyWindow.qml"
        }
        var args = Qt.application.arguments
        if(args.length>=2 && args[1].startsWith("-crashed=")){
            BRouter.navigate("/crash",{crashFilePath:args[1].replace("-crashed=","")})
        }else{
            BRouter.navigate("/")
        }
    }

    property alias hotkeys: object_hotkey
    BObject{
        id: object_hotkey
        BHotkey{
            name: qsTr("Quit")
            sequence: "Ctrl+Alt+Q"
            onActivated: {
                BRouter.exit()
            }
        }
        BHotkey{
            name: qsTr("Test1")
            sequence: "Alt+A"
            onActivated: {
                BRouter.navigate("/hotkey",{sequence:sequence})
            }
        }
        BHotkey{
            name: qsTr("Test2")
            sequence: "Alt+B"
            onActivated: {
                BRouter.navigate("/hotkey",{sequence:sequence})
            }
        }
        BHotkey{
            name: qsTr("Test3")
            sequence: "Alt+C"
            onActivated: {
                BRouter.navigate("/hotkey",{sequence:sequence})
            }
        }
        BHotkey{
            name: qsTr("Test4")
            sequence: "Alt+D"
            onActivated: {
                BRouter.navigate("/hotkey",{sequence:sequence})
            }
        }
        BHotkey{
            name: qsTr("Test5")
            sequence: "Alt+E"
            onActivated: {
                BRouter.navigate("/hotkey",{sequence:sequence})
            }
        }
        BHotkey{
            name: qsTr("Test6")
            sequence: "Alt+F"
            onActivated: {
                BRouter.navigate("/hotkey",{sequence:sequence})
            }
        }
        BHotkey{
            name: qsTr("Test7")
            sequence: "Alt+G"
            onActivated: {
                BRouter.navigate("/hotkey",{sequence:sequence})
            }
        }
        BHotkey{
            name: qsTr("Test8")
            sequence: "Alt+H"
            onActivated: {
                BRouter.navigate("/hotkey",{sequence:sequence})
            }
        }
    }

}
