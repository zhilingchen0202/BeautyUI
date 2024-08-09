import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import BeautyUI 1.0

Window {
    default property alias contentData : layout_content.data
    property string windowIcon: BApp.windowIcon
    property int launchMode: BWindowType.Standard
    property var argument:({})
    property var background : com_background
    property bool fixSize: false
    property Component loadingItem: com_loading
    property bool fitsAppBarWindows: false
    property Item appBar: BAppBar {
        title: window.title
        height: 30
        showDark: window.showDark
        showClose: window.showClose
        showMinimize: window.showMinimize
        showMaximize: window.showMaximize
        showStayTop: window.showStayTop
        icon: window.windowIcon
    }
    property color backgroundColor: {
        if(active){
            return BTheme.windowActiveBackgroundColor
        }
        return BTheme.windowBackgroundColor
    }
    property bool stayTop: false
    property bool showDark: false
    property bool showClose: true
    property bool showMinimize: true
    property bool showMaximize: true
    property bool showStayTop: false
    property bool autoMaximize: false
    property bool autoVisible: true
    property bool autoCenter: true
    property bool autoDestroy: true
    property bool useSystemAppBar
    property int __margins: 0
    property color resizeBorderColor: {
        if(window.active){
            return BTheme.dark ? Qt.rgba(51/255,51/255,51/255,1) : Qt.rgba(110/255,110/255,110/255,1)
        }
        return BTheme.dark ? Qt.rgba(61/255,61/255,61/255,1) : Qt.rgba(167/255,167/255,167/255,1)
    }
    property int resizeBorderWidth: 1
    property var closeListener: function(event){
        if(autoDestroy){
            BRouter.removeWindow(window)
        }else{
            window.visibility = Window.Hidden
            event.accepted = false
        }
    }
    signal initArgument(var argument)
    signal lazyLoad()
    property var _windowRegister
    property string _route
    property bool _hideShadow: false
    id: window
    color: BTools.isSoftware() ? window.backgroundColor : "transparent"
    Component.onCompleted: {
        BRouter.addWindow(window)
        useSystemAppBar = BApp.useSystemAppBar
        if(!useSystemAppBar && autoCenter){
            moveWindowToDesktopCenter()
        }
        fixWindowSize()
        initArgument(argument)
        if(window.autoVisible){
            if(window.autoMaximize){
                window.visibility = Window.Maximized
            }else{
                window.show()
            }
        }
    }
    onVisibleChanged: {
        if(visible && d.isLazyInit){
            window.lazyLoad()
            d.isLazyInit = false
        }
    }
    QtObject{
        id:d
        property bool isLazyInit: true
    }
    Connections{
        target: window
        function onClosing(event){closeListener(event)}
    }
    BFrameless{
        id: frameless
        appbar: window.appBar
        maximizeButton: appBar.buttonMaximize
        fixSize: window.fixSize
        topmost: window.stayTop
        disabled: BApp.useSystemAppBar
        Component.onCompleted: {
            frameless.setHitTestVisible(appBar.layoutMacosButtons)
            frameless.setHitTestVisible(appBar.layoutStandardbuttons)
        }
        Component.onDestruction: {
            frameless.onDestruction()
        }
    }
    Component{
        id:com_background
        Item{
            Rectangle{
                anchors.fill: parent
                color: window.backgroundColor
            }
            Image{
                id:img_back
                visible: false
                cache: false
                fillMode: Image.PreserveAspectCrop
                asynchronous: true
                Component.onCompleted: {
                    img_back.updateLayout()
                    source = BTools.getUrlByFilePath(BTheme.desktopImagePath)
                }
                Connections{
                    target: window
                    function onScreenChanged(){
                        img_back.updateLayout()
                    }
                }
                function updateLayout(){
                    var geometry = BTools.desktopAvailableGeometry(window)
                    img_back.width = geometry.width
                    img_back.height =  geometry.height
                    img_back.sourceSize = Qt.size(img_back.width,img_back.height)
                }
                Connections{
                    target: BTheme
                    function onDesktopImagePathChanged(){
                        timer_update_image.restart()
                    }
                    function onBlurBehindWindowEnabledChanged(){
                        if(BTheme.blurBehindWindowEnabled){
                            img_back.source = BTools.getUrlByFilePath(BTheme.desktopImagePath)
                        }else{
                            img_back.source = ""
                        }
                    }
                }
                Timer{
                    id:timer_update_image
                    interval: 150
                    onTriggered: {
                        img_back.source = ""
                        img_back.source = BTools.getUrlByFilePath(BTheme.desktopImagePath)
                    }
                }
            }
            BAcrylic{
                anchors.fill: parent
                target: img_back
                tintOpacity: BTheme.dark ? 0.80 : 0.75
                blurRadius: 64
                visible: window.active && BTheme.blurBehindWindowEnabled
                tintColor: BTheme.dark ? Qt.rgba(0, 0, 0, 1)  : Qt.rgba(1, 1, 1, 1)
                targetRect: Qt.rect(window.x-window.screen.virtualX,window.y-window.screen.virtualY,window.width,window.height)
            }
        }
    }
    Component{
        id:com_app_bar
        Item{
            data: window.appBar
            Component.onCompleted: {
                window.appBar.width = Qt.binding(function(){
                    return this.parent.width
                })
            }
        }
    }
    Component{
        id:com_loading
        Popup{
            id:popup_loading
            focus: true
            width: window.width
            height: window.height
            anchors.centerIn: Overlay.overlay
            closePolicy: {
                if(cancel){
                    return Popup.CloseOnEscape | Popup.CloseOnPressOutside
                }
                return Popup.NoAutoClose
            }
            Overlay.modal: Item {}
            onVisibleChanged: {
                if(!visible){
                    loader_loading.sourceComponent = undefined
                }
            }
            padding: 0
            opacity: 0
            visible:true
            Behavior on opacity {
                SequentialAnimation {
                    PauseAnimation {
                        duration: 83
                    }
                    NumberAnimation{
                        duration:  167
                    }
                }
            }
            Component.onCompleted: {
                opacity = 1
            }
            background: Rectangle{
                color:"#44000000"
            }
            contentItem: Item{
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        if (cancel){
                            popup_loading.visible = false
                        }
                    }
                }
                ColumnLayout{
                    spacing: 8
                    anchors.centerIn: parent
                    BProgressRing{
                        Layout.alignment: Qt.AlignHCenter
                    }
                    BText{
                        text:loadingText
                        Layout.alignment: Qt.AlignHCenter
                    }
                }
            }
        }
    }
    Component{
        id:com_border
        Rectangle{
            color:"transparent"
            border.width: window.resizeBorderWidth
            border.color: window.resizeBorderColor
        }
    }
    Item{
        id: layout_container
        anchors.fill: parent
        anchors.margins: window.__margins
        BLoader{
            anchors.fill: parent
            sourceComponent: background
        }
        BLoader{
            id:loader_app_bar
            anchors {
                top: parent.top
                left: parent.left
                right: parent.right
            }
            height: {
                if(window.useSystemAppBar){
                    return 0
                }
                return window.fitsAppBarWindows ? 0 : window.appBar.height
            }
            sourceComponent: window.useSystemAppBar ? undefined : com_app_bar
        }
        Item{
            id: layout_content
            anchors{
                top: loader_app_bar.bottom
                left: parent.left
                right: parent.right
                bottom: parent.bottom
            }
            clip: true
        }
        BLoader{
            property string loadingText
            property bool cancel: false
            id:loader_loading
            anchors.fill: parent
        }
        BInfoBar{
            id:info_bar
            root: layout_container
        }
        BLoader{
            id:loader_border
            anchors.fill: parent
            sourceComponent: {
                if(window.useSystemAppBar || BTools.isWin() || window.visibility === Window.Maximized || window.visibility === Window.FullScreen){
                    return undefined
                }
                return com_border
            }
        }
    }
    function hideLoading(){
        loader_loading.sourceComponent = undefined
    }
    function showSuccess(text,duration,moremsg){
        return info_bar.showSuccess(text,duration,moremsg)
    }
    function showInfo(text,duration,moremsg){
        return info_bar.showInfo(text,duration,moremsg)
    }
    function showWarning(text,duration,moremsg){
        return info_bar.showWarning(text,duration,moremsg)
    }
    function showError(text,duration,moremsg){
        return info_bar.showError(text,duration,moremsg)
    }
    function clearAllInfo(){
        return info_bar.clearAllInfo()
    }
    function moveWindowToDesktopCenter(){
        var availableGeometry = BTools.desktopAvailableGeometry(window)
        window.setGeometry((availableGeometry.width-window.width)/2+Screen.virtualX,(availableGeometry.height-window.height)/2+Screen.virtualY,window.width,window.height)
    }
    function fixWindowSize(){
        if(fixSize){
            window.maximumWidth =  window.width
            window.maximumHeight =  window.height
            window.minimumWidth = window.width
            window.minimumHeight = window.height
        }
    }
    function setResult(data){
        if(_windowRegister){
            _windowRegister.setResult(data)
        }
    }
    function showMaximized(){
        frameless.showMaximized()
    }
    function showMinimized(){
        frameless.showMinimized()
    }
    function showNormal(){
        frameless.showNormal()
    }
    function showLoading(text = "",cancel = true){
        if(text===""){
            text = qsTr("Loading...")
        }
        loader_loading.loadingText = text
        loader_loading.cancel = cancel
        loader_loading.sourceComponent = com_loading
    }
    function setHitTestVisible(val){
        frameless.setHitTestVisible(val)
    }
    function deleteLater(){
        BTools.deleteLater(window)
    }
    function containerItem(){
        return layout_container
    }
}