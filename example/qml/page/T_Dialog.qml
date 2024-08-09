import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import BeautyUI 1.0
import "../component"

BScrollablePage{

    title: qsTr("Dialog")

    BFrame{
        Layout.fillWidth: true
        Layout.preferredHeight: 68
        padding: 10
        BButton{
            anchors.verticalCenter: parent.verticalCenter
            text: qsTr("Show Double Button Dialog")
            onClicked: {
                double_btn_dialog.open()
            }
        }
    }
    CodeExpander{
        Layout.fillWidth: true
        Layout.topMargin: -6
        code:'BContentDialog{
    id:dialog
    title: qsTr("Friendly Reminder")
    message: qsTr("Are you sure you want to opt out?")
    negativeText: qsTr("Cancel")
    buttonFlags: BContentDialogType.NegativeButton | BContentDialogType.PositiveButton
    onNegativeClicked:{
        showSuccess(qsTr("Click the Cancel Button"))
    }
    positiveText: qsTr("OK")
    onPositiveClicked:{
        showSuccess(qsTr("Click the OK Button"))
        }
    }
    dialog.open()'
    }

    BContentDialog{
        id:double_btn_dialog
        title: qsTr("Friendly Reminder")
        message: qsTr("Are you sure you want to opt out?")
        buttonFlags: BContentDialogType.NegativeButton | BContentDialogType.PositiveButton
        negativeText: qsTr("Cancel")
        onNegativeClicked: {
            showSuccess(qsTr("Click the Cancel Button"))
        }
        positiveText: qsTr("OK")
        onPositiveClicked:{
            showSuccess(qsTr("Click the OK Button"))
        }
    }

    BFrame{
        Layout.fillWidth: true
        Layout.preferredHeight: 68
        padding: 10
        Layout.topMargin: 20
        BButton{
            anchors.verticalCenter: parent.verticalCenter
            text: qsTr("Show Triple Button Dialog")
            onClicked: {
                triple_btn_dialog.open()
            }
        }
    }
    CodeExpander{
        Layout.fillWidth: true
        Layout.topMargin: -6
        code:'BContentDialog{
    id: dialog
    title: qsTr("Friendly Reminder")
    message: qsTr("Are you sure you want to opt out?")
    negativeText: qsTr("Cancel")
    buttonFlags: BContentDialogType.NeutralButton | BContentDialogType.NegativeButton | BContentDialogType.PositiveButton
    negativeText: qsTr("Cancel")
    onNegativeClicked: {
        showSuccess(qsTr("Click the Cancel Button"))
    }
    positiveText: qsTr("OK")
    onPositiveClicked: {
        showSuccess(qsTr("Click the OK Button"))
    }
    neutralText: qsTr("Minimize")
    onNeutralClicked: {
        showSuccess(qsTr("Click Minimize"))
        }
    }
    dialog.open()'
    }

    BContentDialog{
        id: triple_btn_dialog
        title: qsTr("Friendly Reminder")
        message: qsTr("Are you sure you want to opt out?")
        buttonFlags: BContentDialogType.NeutralButton | BContentDialogType.NegativeButton | BContentDialogType.PositiveButton
        negativeText: qsTr("Cancel")
        onNegativeClicked: {
            showSuccess(qsTr("Click the Cancel Button"))
        }
        positiveText: qsTr("OK")
        onPositiveClicked: {
            showSuccess(qsTr("Click the OK Button"))
        }
        neutralText: qsTr("Minimize")
        onNeutralClicked: {
            showSuccess(qsTr("Click Minimize"))
        }
    }

    BFrame{
        Layout.fillWidth: true
        Layout.preferredHeight: 100
        padding: 10
        Layout.topMargin: 20
        BButton{
            anchors.top: parent.top
            anchors.topMargin: 5
            text: qsTr("Custom Content Dialog")
            onClicked: {
                custom_btn_dialog.open()
            }
        }
        BButton{
            anchors.top: parent.top
            anchors.topMargin: 48
            text: qsTr("Custom Content Dialog2")
            onClicked: {
                custom_btn_dialog2.open()
            }
        }
    }
    CodeExpander{
        Layout.fillWidth: true
        Layout.topMargin: -6
        code:'BContentDialog{
    id: dialog
    title: qsTr("Friendly Reminder")
    message: qsTr("Data is loading, please wait...")
    negativeText: qsTr("Unload")
    contentDelegate: Component{
        Item{
            width: parent.width
            height: 80
            BProgressRing{
                anchors.centerIn: parent
            }
        }
    }
    onNegativeClicked: {
        showSuccess(qsTr("Click the Cancel Button"))
    }
    positiveText :qsTr("OK")
    onPositiveClicked: {
        showSuccess(qsTr("Click the OK Button"))
        }
    }
    dialog.open()'
    }

    BContentDialog{
        id: custom_btn_dialog
        title: qsTr("Friendly Reminder")
        message: qsTr("Data is loading, please wait...")
        negativeText: qsTr("Unload")
        contentDelegate: Component{
            Item{
                implicitWidth: parent.width
                implicitHeight: 80
                BProgressRing{
                    anchors.centerIn: parent
                }
            }
        }
        onNegativeClicked: {
            showSuccess(qsTr("Click the Cancel Button"))
        }
        positiveText: qsTr("OK")
        onPositiveClickListener: function(){
            showError(qsTr("Test the InfoBar level on top of the Popup"))
        }
    }

    BContentDialog{
        id:custom_btn_dialog2
        title: qsTr("Line Chart")
        contentDelegate: Component{
            Item{
                implicitWidth: parent.width
                implicitHeight: 300
                BChart{
                    anchors.fill: parent
                    chartType: 'line'
                    chartData: { return {
                            labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
                            datasets: [{
                                    label: 'My First Dataset',
                                    data: [65, 59, 80, 81, 56, 55, 40],
                                    fill: false,
                                    borderColor: 'rgb(75, 192, 192)',
                                    tension: 0.1
                                }]
                        }
                    }
                    chartOptions: { return {
                            maintainAspectRatio: false,
                            title: {
                                display: true,
                                text: 'Chart.js Line Chart - Stacked'
                            },
                            tooltips: {
                                mode: 'index',
                                intersect: false
                            }
                        }
                    }
                }
            }
        }
        buttonFlags: BContentDialogType.PositiveButton
        positiveText: qsTr("OK")
        onPositiveClicked: {
            showSuccess(qsTr("Click the OK Button"))
        }
    }
}
