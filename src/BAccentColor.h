#pragma once

#include <QObject>
#include <QtQml/qqml.h>
#include <QColor>
#include "stdafx.h"

/**
 * @brief The BAccentColor class
 */
class BAccentColor : public QObject {
    Q_OBJECT

    Q_PROPERTY_AUTO(QColor, darkest)
    Q_PROPERTY_AUTO(QColor, darker)
    Q_PROPERTY_AUTO(QColor, dark)
    Q_PROPERTY_AUTO(QColor, normal)
    Q_PROPERTY_AUTO(QColor, light)
    Q_PROPERTY_AUTO(QColor, lighter)
    Q_PROPERTY_AUTO(QColor, lightest)
    QML_NAMED_ELEMENT(BAccentColor)
public:
    explicit BAccentColor(QObject *parent = nullptr);
};
