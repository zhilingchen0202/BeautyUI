#pragma once

#include <QObject>
#include <QtQml/qqml.h>

#include "BAccentColor.h"
#include "stdafx.h"
#include "singleton.h"

/**
 * @brief The BColors class
 */
class BColors : public QObject {
    Q_OBJECT

    Q_PROPERTY_AUTO(QColor, Transparent)
    Q_PROPERTY_AUTO(QColor, Black)
    Q_PROPERTY_AUTO(QColor, White)
    Q_PROPERTY_AUTO(QColor, Grey10)
    Q_PROPERTY_AUTO(QColor, Grey20)
    Q_PROPERTY_AUTO(QColor, Grey30)
    Q_PROPERTY_AUTO(QColor, Grey40)
    Q_PROPERTY_AUTO(QColor, Grey50)
    Q_PROPERTY_AUTO(QColor, Grey60)
    Q_PROPERTY_AUTO(QColor, Grey70)
    Q_PROPERTY_AUTO(QColor, Grey80)
    Q_PROPERTY_AUTO(QColor, Grey90)
    Q_PROPERTY_AUTO(QColor, Grey100)
    Q_PROPERTY_AUTO(QColor, Grey110)
    Q_PROPERTY_AUTO(QColor, Grey120)
    Q_PROPERTY_AUTO(QColor, Grey130)
    Q_PROPERTY_AUTO(QColor, Grey140)
    Q_PROPERTY_AUTO(QColor, Grey150)
    Q_PROPERTY_AUTO(QColor, Grey160)
    Q_PROPERTY_AUTO(QColor, Grey170)
    Q_PROPERTY_AUTO(QColor, Grey180)
    Q_PROPERTY_AUTO(QColor, Grey190)
    Q_PROPERTY_AUTO(QColor, Grey200)
    Q_PROPERTY_AUTO(QColor, Grey210)
    Q_PROPERTY_AUTO(QColor, Grey220)
    Q_PROPERTY_AUTO_P(BAccentColor *, Yellow)
    Q_PROPERTY_AUTO_P(BAccentColor *, Orange)
    Q_PROPERTY_AUTO_P(BAccentColor *, Red)
    Q_PROPERTY_AUTO_P(BAccentColor *, Magenta)
    Q_PROPERTY_AUTO_P(BAccentColor *, Purple)
    Q_PROPERTY_AUTO_P(BAccentColor *, Blue)
    Q_PROPERTY_AUTO_P(BAccentColor *, Teal)
    Q_PROPERTY_AUTO_P(BAccentColor *, Green)
    QML_NAMED_ELEMENT(BColors)
    QML_SINGLETON

private:
    explicit BColors(QObject *parent = nullptr);

public:
    SINGLETON(BColors)

    [[maybe_unused]] Q_INVOKABLE BAccentColor *createAccentColor(const QColor &primaryColor);

    static BColors *create(QQmlEngine *, QJSEngine *) {
        return getInstance();
    }
};
