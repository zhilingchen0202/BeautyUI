#pragma once

#include <QQuickItem>
#include <QQuickPaintedItem>
#include <QPainter>
#include "stdafx.h"

/**
 * @brief The BCaptcha class
 */
class BCaptcha : public QQuickPaintedItem {
    Q_OBJECT

    Q_PROPERTY_AUTO(QFont, font)
    Q_PROPERTY_AUTO(bool, ignoreCase)
    QML_NAMED_ELEMENT(BCaptcha)

public:
    explicit BCaptcha(QQuickItem *parent = nullptr);

    void paint(QPainter *painter) override;

    Q_INVOKABLE void refresh();

    [[maybe_unused]] Q_INVOKABLE bool verify(const QString &code);

private:
    QString _code;
};
