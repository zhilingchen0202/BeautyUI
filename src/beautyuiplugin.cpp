#include "Beautyuiplugin.h"

#include "BeautyUI.h"

BeautyUIPlugin::BeautyUIPlugin() = default;

void BeautyUIPlugin::registerTypes(const char *uri) {
    BeautyUI::getInstance()->registerTypes(uri);
}

void BeautyUIPlugin::initializeEngine(QQmlEngine *engine, const char *uri) {
    BeautyUI::getInstance()->initializeEngine(engine, uri);
}
