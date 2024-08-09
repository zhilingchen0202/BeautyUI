import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import BeautyUI 1.0

BExpander{

    id:control
    property string code: ""
    headerText: qsTr("Source")
    contentHeight:content.height
    focus: false

    BCopyableText{
        id:content
        width:parent.width
        text:highlightQmlCode(code)
        textFormat: BCopyableText.RichText
        padding: 10
        topPadding: 10
        leftPadding: 10
        rightPadding: 10
        bottomPadding: 10
    }

    BIconButton{
        iconSource:BeautyIcons.Copy
        anchors{
            right: parent.right
            top: parent.top
            rightMargin: 5
            topMargin: 5
        }
        onClicked:{
            BTools.clipText(BTools.html2PlantText(content.text))
            showSuccess(qsTr("The Copy is Successful"))
        }
    }

    function htmlEncode(e){
        var i,s;
        for(i in s={
                "&":/&/g,//""//":/"/g,"'":/'/g,
                "<":/</g,">":/>/g,"<br/>":/\n/g,
                " ":/ /g,"  ":/\t/g
            })e=e.replace(s[i],i);
        return e;
    }

    function highlightQmlCode(code) {
        var qmlKeywords = [
                    "BTextButton",
                    "BAppBar",
                    "BAutoSuggestBox",
                    "BBadge",
                    "BButton",
                    "BCalendarPicker",
                    "BCalendarView",
                    "BCarousel",
                    "BCheckBox",
                    "BColorPicker",
                    "BColorView",
                    "BComboBox",
                    "BContentDialog",
                    "BContentPage",
                    "BDatePicker",
                    "BDivider",
                    "BDropDownButton",
                    "BExpander",
                    "BFilledButton",
                    "BFlipView",
                    "BFocusRectangle",
                    "BIcon",
                    "BIconButton",
                    "BInfoBar",
                    "BMediaPlayer",
                    "BMenu",
                    "BMenuItem",
                    "BMultilineTextBox",
                    "BNavigationView",
                    "BObject",
                    "BPaneItem",
                    "BPaneItemExpander",
                    "BPaneItemHeader",
                    "BPaneItemSeparator",
                    "BPivot",
                    "BPivotItem",
                    "BProgressBar",
                    "BProgressRing",
                    "BRadioButton",
                    "BRectangle",
                    "BScrollablePage",
                    "BScrollBar",
                    "BShadow",
                    "BSlider",
                    "BTabView",
                    "BText",
                    "BTextArea",
                    "BTextBox",
                    "BTextBoxBackground",
                    "BTextBoxMenu",
                    "BTextButton",
                    "BTextFiled",
                    "BTimePicker",
                    "BToggleSwitch",
                    "BTooltip",
                    "BTreeView",
                    "BWindow",
                    "BWindowResize",
                    "BToggleButton",
                    "BTableView",
                    "BColors",
                    "BTheme",
                    "BStatusLayout",
                    "BRatingControl",
                    "BPasswordBox",
                    "BBreadcrumbBar",
                    "BCopyableText",
                    "BAcrylic",
                    "BRemoteLoader",
                    "BMenuBar",
                    "BPagination",
                    "BRadioButtons",
                    "BImage",
                    "BSpinBox",
                    "BWatermark",
                    "BTour",
                    "BQRCode",
                    "BTimeline",
                    "BChart",
                    "BRangeSlider",
                    "BStaggeredLayout",
                    "BProgressButton",
                    "BLoadingButton",
                    "BClip",
                    "BNetwork",
                    "BShortcutPicker",
                    "BWindowResultLauncher",
                    "BRouter",
                    "BGroupBox",
                    "BSheet",
                ];
        code = code.replace(/\n/g, "<br>");
        code = code.replace(/ /g, "&nbsp;");
        return code.replace(RegExp("\\b(" + qmlKeywords.join("|") + ")\\b", "g"), "<span style='color: #c23a80'>$1</span>");
    }
}
