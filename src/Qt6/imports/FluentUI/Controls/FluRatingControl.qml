import QtQuick
import QtQuick.Controls
import BeautyUI

Item {
    property int number: 5
    property int spacing: 4
    property int size: 18
    property int value:0
    id:control
    implicitWidth: container.width
    implicitHeight: container.height
    QtObject{
        id:d
        property int mouseValue: 0
        property int itemSize: control.size+spacing*2
    }
    Row{
        id:container
        spacing: 0
        Repeater{
            model:control.number
            Item{
                width: d.itemSize
                height: d.itemSize
                BIcon{
                    property bool isSelected : {
                        if(d.mouseValue!==0){
                            return index<d.mouseValue
                        }
                        return index<control.value
                    }
                    iconSize: control.size
                    iconSource: isSelected ? BentIcons.FavoriteStarFill : BentIcons.FavoriteStar
                    iconColor: isSelected ? BTheme.primaryColor : (BTheme.dark ? "#FFFFFF" : "#000000")
                    anchors.centerIn: parent
                }
            }
        }
    }
    MouseArea{
        anchors.fill: container
        hoverEnabled: true
        onPositionChanged: (mouse)=>{
            d.mouseValue = Number(mouse.x / d.itemSize)+1
        }
        onExited: {
            d.mouseValue = 0
        }
        onClicked: (mouse)=>{
            control.value = Number(mouse.x / d.itemSize)+1
        }
    }
}
