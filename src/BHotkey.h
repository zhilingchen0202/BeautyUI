#ifndef BHOTKEY_H
#define BHOTKEY_H

#include <QObject>
#include <QQuickItem>
#include "qhotkey/qhotkey.h"
#include "stdafx.h"

class BHotkey : public QObject {

    Q_OBJECT
    Q_PROPERTY_AUTO(QString, sequence)
    Q_PROPERTY_AUTO(QString, name)
    Q_PROPERTY_READONLY_AUTO(bool, isRegistered)
    QML_NAMED_ELEMENT(BHotkey)
public:
    explicit BHotkey(QObject *parent = nullptr);
    ~BHotkey();
    Q_SIGNAL void activated();

private:
    QHotkey *_hotkey = nullptr;
};

#endif // BHOTKEY_H
