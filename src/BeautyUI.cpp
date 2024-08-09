#include "BeautyUI.h"

#include <QGuiApplication>
#include "Def.h"
#include "BIconDef.h"
#include "BApp.h"
#include "BColors.h"
#include "BTheme.h"
#include "BTools.h"
#include "BTextStyle.h"
#include "BWatermark.h"
#include "BCaptcha.h"
#include "BTreeModel.h"
#include "BRectangle.h"
#include "BQrCodeItem.h"
#include "BTableSortProxyModel.h"
#include "BFrameless.h"
#include "BTableModel.h"
#include "BHotkey.h"
#include "qmlcustomplot/TimePlot.h"
#include "qmlcustomplot/baseplot.h"
#include "qmlcustomplot/axis.h"
#include "qmlcustomplot/ticker.h"
#include "qmlcustomplot/grid.h"

void BeautyUI::registerTypes(QQmlEngine *engine) {
    initializeEngine(engine, _uri);
    registerTypes(_uri);
}

void BeautyUI::registerTypes(const char *uri) const {
#if (QT_VERSION < QT_VERSION_CHECK(6, 2, 0))
    Q_INIT_RESOURCE(beautyui);
    int major = _major;
    int minor = _minor;
    //@uri BeautyUI
    qmlRegisterType<BQrCodeItem>(uri, major, minor, "BQrCodeItem");
    qmlRegisterType<BCaptcha>(uri, major, minor, "BCaptcha");
    qmlRegisterType<BWatermark>(uri, major, minor, "BWatermark");
    qmlRegisterType<BAccentColor>(uri, major, minor, "BAccentColor");
    qmlRegisterType<BTreeModel>(uri, major, minor, "BTreeModel");
    qmlRegisterType<BTableModel>(uri, major, minor, "BTableModel");
    qmlRegisterType<BRectangle>(uri, major, minor, "BRectangle");
    qmlRegisterType<BFrameless>(uri, major, minor, "BFrameless");
    qmlRegisterType<BHotkey>(uri, major, minor, "BHotkey");
    qmlRegisterType<BTableSortProxyModel>(uri, major, minor, "BTableSortProxyModel");

    qmlRegisterType<QmlQCustomPlot::TimePlot>(uri, major, minor, "TimePlot");
    qmlRegisterType<QmlQCustomPlot::BasePlot>(uri, major, minor, "BasePlot");

    qmlRegisterUncreatableType<QmlQCustomPlot::Axis>(uri, major, minor, "Axis", "");
    qmlRegisterUncreatableType<QmlQCustomPlot::Ticker>(uri, major, minor, "Ticker", "");
    qmlRegisterUncreatableType<QmlQCustomPlot::Grid>(uri, major, minor, "PlotGrid", "");

    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BAcrylic.qml"), uri, major, minor, "BAcrylic");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BAppBar.qml"), uri, major, minor, "BAppBar");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BFrame.qml"), uri, major, minor, "BFrame");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BAutoSuggestBox.qml"), uri, major, minor, "BAutoSuggestBox");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BBadge.qml"), uri, major, minor, "BBadge");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BBreadcrumbBar.qml"), uri, major, minor, "BBreadcrumbBar");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BButton.qml"), uri, major, minor, "BButton");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BCalendarPicker.qml"), uri, major, minor, "BCalendarPicker");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BCarousel.qml"), uri, major, minor, "BCarousel");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BChart.qml"), uri, major, minor, "BChart");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BCheckBox.qml"), uri, major, minor, "BCheckBox");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BColorPicker.qml"), uri, major, minor, "BColorPicker");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BComboBox.qml"), uri, major, minor, "BComboBox");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BContentDialog.qml"), uri, major, minor, "BContentDialog");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BContentPage.qml"), uri, major, minor, "BContentPage");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BControl.qml"), uri, major, minor, "BControl");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BCopyableText.qml"), uri, major, minor, "BCopyableText");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BDatePicker.qml"), uri, major, minor, "BDatePicker");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BDivider.qml"), uri, major, minor, "BDivider");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BDropDownButton.qml"), uri, major, minor, "BDropDownButton");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BExpander.qml"), uri, major, minor, "BExpander");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BFilledButton.qml"), uri, major, minor, "BFilledButton");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BFlipView.qml"), uri, major, minor, "BFlipView");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BFocusRectangle.qml"), uri, major, minor, "BFocusRectangle");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BIcon.qml"), uri, major, minor, "BIcon");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BIconButton.qml"), uri, major, minor, "BIconButton");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BImage.qml"), uri, major, minor, "BImage");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BImageButton.qml"), uri, major, minor, "BImageButton");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BInfoBar.qml"), uri, major, minor, "BInfoBar");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BItemDelegate.qml"), uri, major, minor, "BItemDelegate");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BMenu.qml"), uri, major, minor, "BMenu");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BMenuBar.qml"), uri, major, minor, "BMenuBar");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BMenuBarItem.qml"), uri, major, minor, "BMenuBarItem");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BMenuItem.qml"), uri, major, minor, "BMenuItem");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BMenuSeparator.qml"), uri, major, minor, "BMenuSeparator");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BMultilineTextBox.qml"), uri, major, minor, "BMultilineTextBox");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BNavigationView.qml"), uri, major, minor, "BNavigationView");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BObject.qml"), uri, major, minor, "BObject");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BPage.qml"), uri, major, minor, "BPage");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BPagination.qml"), uri, major, minor, "BPagination");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BPaneItem.qml"), uri, major, minor, "BPaneItem");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BPaneItemEmpty.qml"), uri, major, minor, "BPaneItemEmpty");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BPaneItemExpander.qml"), uri, major, minor, "BPaneItemExpander");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BPaneItemHeader.qml"), uri, major, minor, "BPaneItemHeader");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BPaneItemSeparator.qml"), uri, major, minor, "BPaneItemSeparator");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BPasswordBox.qml"), uri, major, minor, "BPasswordBox");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BPivot.qml"), uri, major, minor, "BPivot");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BPivotItem.qml"), uri, major, minor, "BPivotItem");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BPopup.qml"), uri, major, minor, "BPopup");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BProgressBar.qml"), uri, major, minor, "BProgressBar");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BProgressRing.qml"), uri, major, minor, "BProgressRing");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BQRCode.qml"), uri, major, minor, "BQRCode");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BRadioButton.qml"), uri, major, minor, "BRadioButton");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BRadioButtons.qml"), uri, major, minor, "BRadioButtons");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BRatingControl.qml"), uri, major, minor, "BRatingControl");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BRemoteLoader.qml"), uri, major, minor, "BRemoteLoader");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BScrollBar.qml"), uri, major, minor, "BScrollBar");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BScrollIndicator.qml"), uri, major, minor, "BScrollIndicator");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BScrollablePage.qml"), uri, major, minor, "BScrollablePage");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BShadow.qml"), uri, major, minor, "BShadow");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BSlider.qml"), uri, major, minor, "BSlider");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BSpinBox.qml"), uri, major, minor, "BSpinBox");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BStatusLayout.qml"), uri, major, minor, "BStatusLayout");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BTabView.qml"), uri, major, minor, "BTabView");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BTableView.qml"), uri, major, minor, "BTableView");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BText.qml"), uri, major, minor, "BText");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BTextBox.qml"), uri, major, minor, "BTextBox");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BTextBoxBackground.qml"), uri, major, minor, "BTextBoxBackground");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BTextBoxMenu.qml"), uri, major, minor, "BTextBoxMenu");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BTextButton.qml"), uri, major, minor, "BTextButton");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BTimePicker.qml"), uri, major, minor, "BTimePicker");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BTimeline.qml"), uri, major, minor, "BTimeline");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BToggleButton.qml"), uri, major, minor, "BToggleButton");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BToggleSwitch.qml"), uri, major, minor, "BToggleSwitch");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BTooltip.qml"), uri, major, minor, "BTooltip");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BTour.qml"), uri, major, minor, "BTour");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BTreeView.qml"), uri, major, minor, "BTreeView");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BWindow.qml"), uri, major, minor, "BWindow");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BWindowDialog.qml"), uri, major, minor, "BWindowDialog");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BRangeSlider.qml"), uri, major, minor, "BRangeSlider");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BStaggeredLayout.qml"), uri, major, minor, "BStaggeredLayout");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BProgressButton.qml"), uri, major, minor, "BProgressButton");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BLoadingButton.qml"), uri, major, minor, "BLoadingButton");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BClip.qml"), uri, major, minor, "BClip");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BLoader.qml"), uri, major, minor, "BLoader");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BShortcutPicker.qml"), uri, major, minor, "BShortcutPicker");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BSplitLayout.qml"), uri, major, minor, "BSplitLayout");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BWindowResultLauncher.qml"), uri, major, minor, "BWindowResultLauncher");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BLauncher.qml"), uri, major, minor, "BLauncher");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BEvent.qml"), uri, major, minor, "BEvent");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BSheet.qml"), uri, major, minor, "BSheet");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BGroupBox.qml"), uri, major, minor, "BGroupBox");
    qmlRegisterType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BControlBackground.qml"), uri, major, minor, "BControlBackground");
    qmlRegisterSingletonType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BRouter.qml"), uri, major, minor, "BRouter");
    qmlRegisterSingletonType(QUrl("qrc:/qt/qml/BeautyUI/Controls/BEventBus.qml"), uri, major, minor, "BEventBus");

    qmlRegisterUncreatableMetaObject(BeautyIcons::staticMetaObject, uri, major, minor, "BeautyIcons", "Access to enums & flags only");
    qmlRegisterUncreatableMetaObject(BThemeType::staticMetaObject, uri, major, minor, "BThemeType", "Access to enums & flags only");
    qmlRegisterUncreatableMetaObject(BPageType::staticMetaObject, uri, major, minor, "BPageType", "Access to enums & flags only");
    qmlRegisterUncreatableMetaObject(BWindowType::staticMetaObject, uri, major, minor, "BWindowType", "Access to enums & flags only");
    qmlRegisterUncreatableMetaObject(BTreeViewType::staticMetaObject, uri, major, minor, "BTreeViewType", "Access to enums & flags only");
    qmlRegisterUncreatableMetaObject(BStatusLayoutType::staticMetaObject, uri, major, minor, "BStatusLayoutType", "Access to enums & flags only");
    qmlRegisterUncreatableMetaObject(BContentDialogType::staticMetaObject, uri, major, minor, "BContentDialogType", "Access to enums & flags only");
    qmlRegisterUncreatableMetaObject(BTimePickerType::staticMetaObject, uri, major, minor, "BTimePickerType", "Access to enums & flags only");
    qmlRegisterUncreatableMetaObject(BCalendarViewType::staticMetaObject, uri, major, minor, "BCalendarViewType", "Access to enums & flags only");
    qmlRegisterUncreatableMetaObject(BTabViewType::staticMetaObject, uri, major, minor, "BTabViewType", "Access to enums & flags only");
    qmlRegisterUncreatableMetaObject(BNavigationViewType::staticMetaObject, uri, major, minor, "BNavigationViewType", "Access to enums & flags only");
    qmlRegisterUncreatableMetaObject(BTimelineType::staticMetaObject, uri, major, minor, "BTimelineType", "Access to enums & flags only");
    qmlRegisterUncreatableMetaObject(BSheetType::staticMetaObject, uri, major, minor, "BSheetType", "Access to enums & flags only");

    qmlRegisterSingletonType(uri, major, minor, "BApp", [](QQmlEngine *engine, QJSEngine *scriptEngine) -> QJSValue {
        Q_UNUSED(engine)
        return scriptEngine->newQObject(BApp::getInstance());
    });
    qmlRegisterSingletonType(uri, major, minor, "BColors", [](QQmlEngine *engine, QJSEngine *scriptEngine) -> QJSValue {
        Q_UNUSED(engine)
        return scriptEngine->newQObject(BColors::getInstance());
    });
    qmlRegisterSingletonType(uri, major, minor, "BTheme", [](QQmlEngine *engine, QJSEngine *scriptEngine) -> QJSValue {
        Q_UNUSED(engine)
        return scriptEngine->newQObject(BTheme::getInstance());
    });
    qmlRegisterSingletonType(uri, major, minor, "BTools", [](QQmlEngine *engine, QJSEngine *scriptEngine) -> QJSValue {
        Q_UNUSED(engine)
        return scriptEngine->newQObject(BTools::getInstance());
    });
    qmlRegisterSingletonType(uri, major, minor, "BTextStyle", [](QQmlEngine *engine, QJSEngine *scriptEngine) -> QJSValue {
        Q_UNUSED(engine)
        return scriptEngine->newQObject(BTextStyle::getInstance());
    });
//    qmlRegisterSingletonInstance(uri, major, minor, "BApp", BApp::getInstance());
//    qmlRegisterSingletonInstance(uri, major, minor, "BColors", BColors::getInstance());
//    qmlRegisterSingletonInstance(uri, major, minor, "BTheme", BTheme::getInstance());
//    qmlRegisterSingletonInstance(uri, major, minor, "BTools", BTools::getInstance());
//    qmlRegisterSingletonInstance(uri, major, minor, "BTextStyle", BTextStyle::getInstance());
    qmlRegisterModule(uri, major, minor);
#endif
}

void BeautyUI::initializeEngine(QQmlEngine *engine, [[maybe_unused]] const char *uri) {
    Q_UNUSED(engine)
}
