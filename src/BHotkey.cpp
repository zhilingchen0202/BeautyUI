#include "BHotkey.h"

#include "QGuiApplication"


BHotkey::BHotkey(QObject *parent) : QObject{parent} {
    _sequence = "";
    _isRegistered = false;
    connect(this, &BHotkey::sequenceChanged, this, [=] {
        if (_hotkey) {
            delete _hotkey;
            _hotkey = nullptr;
        }
        _hotkey = new QHotkey(QKeySequence(_sequence), true, qApp);
        this->isRegistered(_hotkey->isRegistered());
        QObject::connect(_hotkey, &QHotkey::activated, qApp, [=]() { Q_EMIT this->activated(); });
        QObject::connect(_hotkey, &QHotkey::registeredChanged, qApp,
                         [=]() { this->isRegistered(_hotkey->isRegistered()); });
    });
}

BHotkey::~BHotkey() {
    if (_hotkey) {
        delete _hotkey;
        _hotkey = nullptr;
    }
}
