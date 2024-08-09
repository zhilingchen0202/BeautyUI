import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import BeautyUI 1.0
import "../component"

BScrollablePage{

    title: qsTr("Pie Chart")

    BFrame{
        Layout.preferredWidth: 500
        Layout.preferredHeight: 370
        padding: 10
        Layout.topMargin: 20
        BChart{
            anchors.fill: parent
            chartType: "doughnut"
            chartData: { return {
                    labels: [
                        'Red',
                        'Blue',
                        'Yellow'
                    ],
                    datasets: [{
                            label: 'My First Dataset',
                            data: [300, 50, 100],
                            backgroundColor: [
                                'rgb(255, 99, 132)',
                                'rgb(54, 162, 235)',
                                'rgb(255, 205, 86)'
                            ],
                            hoverOffset: 4
                        }]
                }
            }
            chartOptions: { return {
                    maintainAspectRatio: false,
                    title: {
                        display: true,
                        text: 'Chart.js Doughnut Chart - Stacked'
                    },
                    tooltips: {
                        mode: 'index',
                        intersect: false
                    }
                }
            }
        }
    }

    BFrame{
        Layout.preferredWidth: 500
        Layout.preferredHeight: 370
        padding: 10
        Layout.topMargin: 20
        BChart{
            anchors.fill: parent
            chartType: "pie"
            chartData: { return {
                    labels: [
                        'Red',
                        'Blue',
                        'Yellow'
                    ],
                    datasets: [{
                            label: 'My First Dataset',
                            data: [300, 50, 100],
                            backgroundColor: [
                                'rgb(255, 99, 132)',
                                'rgb(54, 162, 235)',
                                'rgb(255, 205, 86)'
                            ],
                            hoverOffset: 4
                        }]
                }
            }
            chartOptions: { return {
                    maintainAspectRatio: false,
                    title: {
                        display: true,
                        text: 'Chart.js Pie Chart - Stacked'
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
