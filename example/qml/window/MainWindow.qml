import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQml 2.15
import Qt.labs.platform 1.1
import BeautyUI 1.0
import example 1.0
import "../component"
import "../global"

BWindow {

    id:window
    title: "BeautyUI"
    width: 1000
    height: 668
    minimumWidth: 668
    minimumHeight: 320
    launchMode: BWindowType.SingleTask
    fitsAppBarWindows: true
    appBar: BAppBar {
        height: 30
        showDark: true
        darkClickListener:(button)=>handleDarkChanged(button)
        closeClickListener: ()=>{dialog_close.open()}
        z:7
    }

    BeautyInitializrWindow{
        id:beautyInitializr
    }

    BEvent{
        name: "checkUpdate"
        onTriggered: {
            checkUpdate(false)
        }
    }

    onLazyLoad: {
        tour.open()
    }

    Component.onCompleted: {
        checkUpdate(true)
    }

    Component.onDestruction: {
        BRouter.exit()
    }

    SystemTrayIcon {
        id:system_tray
        visible: true
        icon.source: "qrc:/example/res/image/favicon.ico"
        tooltip: "BeautyUI"
        menu: Menu {
            MenuItem {
                text: "退出"
                onTriggered: {
                    BRouter.exit()
                }
            }
        }
        onActivated:
            (reason)=>{
                if(reason === SystemTrayIcon.Trigger){
                    window.show()
                    window.raise()
                    window.requestActivate()
                }
            }
    }

    Timer{
        id: timer_window_hide_delay
        interval: 150
        onTriggered: {
            window.hide()
        }
    }

    BContentDialog{
        id: dialog_close
        title: qsTr("Quit")
        message: qsTr("Are you sure you want to exit the program?")
        negativeText: qsTr("Minimize")
        buttonFlags: BContentDialogType.NegativeButton | BContentDialogType.NeutralButton | BContentDialogType.PositiveButton
        onNegativeClicked: {
            system_tray.showMessage(qsTr("Friendly Reminder"),qsTr("BeautyUI is hidden from the tray, click on the tray to activate the window again"));
            timer_window_hide_delay.restart()
        }
        positiveText: qsTr("Quit")
        neutralText: qsTr("Cancel")
        onPositiveClicked:{
            BRouter.exit(0)
        }
    }

    Component{
        id: nav_item_right_menu
        BMenu{
            width: 186
            BMenuItem{
                text: qsTr("Open in Separate Window")
                font: BTextStyle.Caption
                onClicked: {
                    BRouter.navigate("/pageWindow",{title:modelData.title,url:modelData.url})
                }
            }
        }
    }

    Flipable{
        id:flipable
        anchors.fill: parent
        property bool flipped: false
        property real flipAngle: 0
        transform: Rotation {
            id: rotation
            origin.x: flipable.width/2
            origin.y: flipable.height/2
            axis { x: 0; y: 1; z: 0 }
            angle: flipable.flipAngle

        }
        states: State {
            PropertyChanges { target: flipable; flipAngle: 180 }
            when: flipable.flipped
        }
        transitions: Transition {
            NumberAnimation { target: flipable; property: "flipAngle"; duration: 1000 ; easing.type: Easing.OutCubic}
        }
        back: Item{
            anchors.fill: flipable
            visible: flipable.flipAngle !== 0
            Row{
                id:layout_back_buttons
                z:8
                anchors{
                    top: parent.top
                    left: parent.left
                    topMargin: BTools.isMacos() ? 20 : 5
                    leftMargin: 5
                }
                BIconButton{
                    iconSource: BeautyIcons.ChromeBack
                    width: 30
                    height: 30
                    iconSize: 13
                    onClicked: {
                        flipable.flipped = false
                    }
                }
                BIconButton{
                    iconSource: BeautyIcons.Sync
                    width: 30
                    height: 30
                    iconSize: 13
                    onClicked: {
                        loader.reload()
                    }
                }
                Component.onCompleted: {
                    window.setHitTestVisible(layout_back_buttons)
                }
            }
            BRemoteLoader{
                id:loader
                lazy: true
                anchors.fill: parent
                source: ""
            }
        }
        front: Item{
            id:page_front
            visible: flipable.flipAngle !== 180
            anchors.fill: flipable
            BNavigationView{
                property int clickCount: 0
                id:nav_view
                width: parent.width
                height: parent.height
                z:999
                //Stack模式，每次切换都会将页面压入栈中，随着栈的页面增多，消耗的内存也越多，内存消耗多就会卡顿，这时候就需要按返回将页面pop掉，释放内存。该模式可以配合BPage中的launchMode属性，设置页面的启动模式
                //                pageMode: BNavigationViewType.Stack
                //NoStack模式，每次切换都会销毁之前的页面然后创建一个新的页面，只需消耗少量内存
                pageMode: BNavigationViewType.NoStack
                items: ItemsOriginal
                footerItems:ItemsFooter
                topPadding:{
                    if(window.useSystemAppBar){
                        return 0
                    }
                    return BTools.isMacos() ? 20 : 0
                }
                displayMode: GlobalModel.displayMode
                logo: "qrc:/example/res/image/favicon.ico"
                title:"BeautyUI"
                onLogoClicked:{
                    clickCount += 1
                    showSuccess("%1:%2".arg(qsTr("Click Time")).arg(clickCount))
                    if(clickCount === 5){
                        loader.reload()
                        flipable.flipped = true
                        clickCount = 0
                    }
                }
                autoSuggestBox:BAutoSuggestBox{
                    iconSource: BeautyIcons.Search
                    items: ItemsOriginal.getSearchData()
                    placeholderText: qsTr("Search")
                    onItemClicked:
                        (data)=>{
                            ItemsOriginal.startPageByItem(data)
                        }
                }
                Component.onCompleted: {
                    ItemsOriginal.navigationView = nav_view
                    ItemsOriginal.paneItemMenu = nav_item_right_menu
                    ItemsFooter.navigationView = nav_view
                    ItemsFooter.paneItemMenu = nav_item_right_menu
                    window.setHitTestVisible(nav_view.buttonMenu)
                    window.setHitTestVisible(nav_view.buttonBack)
                    window.setHitTestVisible(nav_view.imageLogo)
                    setCurrentIndex(0)
                }
            }
        }
    }

    Component{
        id: com_reveal
        CircularReveal{
            id: reveal
            target: window.containerItem()
            anchors.fill: parent
            onAnimationFinished:{
                //动画结束后释放资源
                loader_reveal.sourceComponent = undefined
            }
            onImageChanged: {
                changeDark()
            }
        }
    }

    BLoader{
        id:loader_reveal
        anchors.fill: parent
    }

    function distance(x1,y1,x2,y2){
        return Math.sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2))
    }

    function handleDarkChanged(button){
        if(!BTheme.animationEnabled || window.fitsAppBarWindows === false){
            changeDark()
        }else{
            if(loader_reveal.sourceComponent){
                return
            }
            loader_reveal.sourceComponent = com_reveal
            var target = window.containerItem()
            var pos = button.mapToItem(target,0,0)
            var mouseX = pos.x
            var mouseY = pos.y
            var radius = Math.max(distance(mouseX,mouseY,0,0),distance(mouseX,mouseY,target.width,0),distance(mouseX,mouseY,0,target.height),distance(mouseX,mouseY,target.width,target.height))
            var reveal = loader_reveal.item
            reveal.start(reveal.width*Screen.devicePixelRatio,reveal.height*Screen.devicePixelRatio,Qt.point(mouseX,mouseY),radius)
        }
    }

    function changeDark(){
        if(BTheme.dark){
            BTheme.darkMode = BThemeType.Light
        }else{
            BTheme.darkMode = BThemeType.Dark
        }
    }

    Shortcut {
        sequence: "F5"
        context: Qt.WindowShortcut
        onActivated: {
            if(flipable.flipped){
                loader.reload()
            }
        }
    }

    Shortcut {
        sequence: "F6"
        context: Qt.WindowShortcut
        onActivated: {
            tour.open()
        }
    }

    BTour{
        id: tour
        finishText: qsTr("Finish")
        nextText: qsTr("Next")
        previousText: qsTr("Previous")
        steps:{
            var data = []
            if(!window.useSystemAppBar){
                data.push({title:qsTr("Dark Mode"),description: qsTr("Here you can switch to night mode."),target:()=>appBar.buttonDark})
            }
            data.push({title:qsTr("Hide Easter eggs"),description: qsTr("Try a few more clicks!!"),target:()=>nav_view.imageLogo})
            return data
        }
    }

    FpsItem{
        id:fps_item
    }

    BText{
        text: "fps %1".arg(fps_item.fps)
        opacity: 0.3
        anchors{
            bottom: parent.bottom
            right: parent.right
            bottomMargin: 5
            rightMargin: 5
        }
    }

    BContentDialog{
        property string newVerson
        property string body
        id: dialog_update
        title: qsTr("Upgrade Tips")
        message:qsTr("BeautyUI is currently up to date ")+ newVerson +qsTr(" -- The current app version") +AppInfo.version+qsTr(" \nNow go and download the new version？\n\nUpdated content: \n")+body
        buttonFlags: BContentDialogType.NegativeButton | BContentDialogType.PositiveButton
        negativeText: qsTr("Cancel")
        positiveText: qsTr("OK")
        onPositiveClicked:{
            Qt.openUrlExternally("")
        }
    }

    NetworkCallable{
        id:callable
        property bool silent: true
        onStart: {
            console.debug("start check update...")
        }
        onFinish: {
            console.debug("check update finish")
            BEventBus.post("checkUpdateFinish");
        }
        onSuccess:
            (result)=>{
                var data = JSON.parse(result)
                console.debug("current version "+AppInfo.version)
                console.debug("new version "+data.tag_name)
                if(data.tag_name !== AppInfo.version){
                    dialog_update.newVerson =  data.tag_name
                    dialog_update.body = data.body
                    dialog_update.open()
                }else{
                    if(!silent){
                        showInfo(qsTr("The current version is already the latest"))
                    }
                }
            }
        onError:
            (status,errorString)=>{
                if(!silent){
                    showError(qsTr("The network is abnormal"))
                }
                console.debug(status+";"+errorString)
            }
    }

    function checkUpdate(silent){
        callable.silent = silent
        Network.get("")
        .go(callable)
    }
}
