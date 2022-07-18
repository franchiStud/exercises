#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "boolcontrols.h"
#include "timervalues.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    QQmlContext * context = engine.rootContext();

    BoolControls controls;
    TimerValues timerValues;

    context->setContextProperty("controls", &controls);
    context->setContextProperty("timerValues",&timerValues);

    const QUrl url(u"qrc:/Clock/main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
