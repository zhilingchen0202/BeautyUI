#include "BApp.h"

#include <QGuiApplication>
#include <QQuickItem>
#include <QTimer>
#include <QUuid>
#include <QFontDatabase>
#include <QClipboard>
#include <QTranslator>
#include <utility>
#include "BIconDef.h"

BApp::BApp(QObject *parent) : QObject{parent} {
    _useSystemAppBar = false;
}

BApp::~BApp() = default;

void BApp::init(QObject *launcher, QLocale locale) {
    this->launcher(launcher);
    _locale = std::move(locale);
    _engine = qmlEngine(launcher);
    _translator = new QTranslator(this);
    QGuiApplication::installTranslator(_translator);
    const QStringList uiLanguages = _locale.uiLanguages();
    for (const QString &name : uiLanguages) {
        const QString baseName = "BeautyUI_" + QLocale(name).name();
        if (_translator->load(":/qt/qml/BeautyUI/i18n/" + baseName)) {
            _engine->retranslate();
            break;
        }
    }
}

[[maybe_unused]] QJsonArray BApp::iconData(const QString &keyword) {
    QJsonArray arr;
    QMetaEnum enumType = BeautyIcons::staticMetaObject.enumerator(
        BeautyIcons::staticMetaObject.indexOfEnumerator("Type"));
    for (int i = 0; i <= enumType.keyCount() - 1; ++i) {
        QString name = enumType.key(i);
        int icon = enumType.value(i);
        if (keyword.isEmpty() || name.contains(keyword)) {
            QJsonObject obj;
            obj.insert("name", name);
            obj.insert("icon", icon);
            arr.append(obj);
        }
    }
    return arr;
}
