import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import BeautyUI 1.0
import "../component"

BScrollablePage{

    property string password: ""

    title: qsTr("MultiWindow")

    BWindowResultLauncher{
        id:loginResultLauncher
        path: "/login"
        onResult:
            (data)=>{
                password = data.password
            }

    }

    BFrame{
        Layout.fillWidth: true
        Layout.preferredHeight: 86
        padding: 10
        Column{
            spacing: 15
            anchors{
                verticalCenter: parent.verticalCenter
                left: parent.left
            }
            BText{
                text: qsTr("<font color='red'>Standard</font> mode window，a new window is created every time")
            }
            BButton{
                text: qsTr("Create Window")
                onClicked: {
                    BRouter.navigate("/standardWindow")
                }
            }
        }
    }

    BFrame{
        Layout.fillWidth: true
        Layout.preferredHeight: 86
        padding: 10
        Layout.topMargin: 10
        Column{
            spacing: 15
            anchors{
                verticalCenter: parent.verticalCenter
                left: parent.left
            }
            BText{
                text: qsTr("<font color='red'>SingleTask</font> mode window，If a window exists, this activates the window")
                textFormat: Text.RichText
            }
            BButton{
                text: qsTr("Create Window")
                onClicked: {
                    BRouter.navigate("/singleTaskWindow")
                }
            }
        }
    }

    BFrame{
        Layout.fillWidth: true
        Layout.preferredHeight: 86
        padding: 10
        Layout.topMargin: 10
        Column{
            spacing: 15
            anchors{
                verticalCenter: parent.verticalCenter
                left: parent.left
            }
            BText{
                text: qsTr("<font color='red'>SingleInstance</font> mode window，If the window exists, destroy the window and create a new window")
            }
            BButton{
                text: qsTr("Create Window")
                onClicked: {
                    BRouter.navigate("/singleInstanceWindow")
                }
            }
        }
    }
    CodeExpander{
        Layout.fillWidth: true
        Layout.topMargin: -6
        code:'BWindow{
  //launchMode: BWindowType.Standard
  //launchMode: BWindowType.SingleTask
     launchMode: BWindowType.SingleInstance
}
'
    }


    BFrame{
        Layout.fillWidth: true
        Layout.preferredHeight: 100
        padding: 10
        Layout.topMargin: 20
        Column{
            spacing: 15
            anchors{
                verticalCenter: parent.verticalCenter
                left: parent.left
            }
            BText{
                text: qsTr("Create the window without carrying any parameters")
            }
            BButton{
                text: qsTr("Create Window")
                onClicked: {
                    BRouter.navigate("/about")
                }
            }
        }
    }
    CodeExpander{
        Layout.fillWidth: true
        Layout.topMargin: -6
        code:'BButton{
    text: qsTr("Create Window")
    onClicked: {
        BRouter.navigate("/about")
    }
}
'
    }

    BFrame{
        Layout.fillWidth: true
        Layout.preferredHeight: 130
        padding: 10
        Layout.topMargin: 20

        Column{
            spacing: 15
            anchors{
                verticalCenter: parent.verticalCenter
                left: parent.left
            }
            BText{
                text: qsTr("Create a window with the parameter username: beautyui")
            }
            BButton{
                text: qsTr("Create Window")
                onClicked: {
                    loginResultLauncher.launch({username:"beautyui"})
                }
            }
            BText{
                text:qsTr("Login Window Returned Password - >")+password
            }
        }
    }
    CodeExpander{
        Layout.fillWidth: true
        Layout.topMargin: -6
        code:'BWindowResultLauncher{
    id:loginResultLauncher
    path: "/login"
    onResult:
        (data)=>{
            password = data.password
     }
}

BButton{
    text: qsTr("Create Window")
    onClicked: {
        loginResultLauncher.launch({username:"beautyui"})
    }
}
'
    }

}
