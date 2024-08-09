import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import BeautyUI 1.0
import "../component"

BContentPage{

    title: qsTr("Watermark")

    BFrame{
        anchors.fill: parent

        ColumnLayout{
            anchors{
                left: parent.left
                leftMargin: 14
            }

            RowLayout{
                spacing: 10
                Layout.topMargin: 14
                BText{
                    text: "text:"
                    Layout.alignment: Qt.AlignVCenter
                }
                BTextBox{
                    id: text_box
                    text: "会磨刀的小猪"
                    Layout.preferredWidth: 240
                }
            }

            RowLayout{
                spacing: 10
                BText{
                    text: "textSize:"
                    Layout.alignment: Qt.AlignVCenter
                }
                BSlider{
                    id: slider_text_size
                    value: 20
                    from: 13
                    to:50
                }
            }
            RowLayout{
                spacing: 10
                BText{
                    text: "gapX:"
                    Layout.alignment: Qt.AlignVCenter
                }
                BSlider{
                    id:slider_gap_x
                    value: 100
                }
            }
            RowLayout{
                spacing: 10
                BText{
                    text: "gapY:"
                    Layout.alignment: Qt.AlignVCenter
                }
                BSlider{
                    id: slider_gap_y
                    value: 100
                }
            }
            RowLayout{
                spacing: 10
                BText{
                    text: "offsetX:"
                    Layout.alignment: Qt.AlignVCenter
                }
                BSlider{
                    id:slider_offset_x
                    value: 50
                }
            }
            RowLayout{
                spacing: 10
                BText{
                    text: "offsetY:"
                    Layout.alignment: Qt.AlignVCenter
                }
                BSlider{
                    id: slider_offset_y
                    value: 50
                }
            }
            RowLayout{
                spacing: 10
                BText{
                    text: "rotate:"
                    Layout.alignment: Qt.AlignVCenter
                }
                BSlider{
                    id: slider_rotate
                    value: 22
                    from: 0
                    to:360
                }
            }
            RowLayout{
                spacing: 10
                BText{
                    text: "textColor:"
                    Layout.alignment: Qt.AlignVCenter
                }
                BColorPicker{
                    id: color_picker
                    current: Qt.rgba(0,0,0,0.1)
                }
            }
        }

        BWatermark{
            id: water_mark
            anchors.fill: parent
            text:text_box.text
            textColor: color_picker.current
            textSize: slider_text_size.value
            rotate: slider_rotate.value
            gap:Qt.point(slider_gap_x.value,slider_gap_y.value)
            offset: Qt.point(slider_offset_x.value,slider_offset_y.value)
        }
    }

}
