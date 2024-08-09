#pragma once

#include <QObject>
#include <QQmlEngine>
#include "singleton.h"

/**
 * @brief The BeautyUI class
 */
class BeautyUI : public QObject {
    Q_OBJECT

public:
    SINGLETON(BeautyUI)

    Q_DECL_EXPORT void registerTypes(QQmlEngine *engine);

    void registerTypes(const char *uri) const;

    void initializeEngine(QQmlEngine *engine, [[maybe_unused]] const char *uri);

private:
    const int _major = 1;
    const int _minor = 0;
    const char *_uri = "BeautyUI";
};
