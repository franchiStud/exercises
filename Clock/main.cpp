#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "boolcontrols.h"
#include "timervalues.h"
#include "date.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    BoolControls controls;
    TimerValues timerValues;
    Date date, alarmDateSet(nullptr,false);

    QQmlApplicationEngine engine;
    QQmlContext * context = engine.rootContext();

    context->setContextProperty("controls",&controls);
    context->setContextProperty("timerValues",&timerValues);
    context->setContextProperty("currentDate",&date);
    context->setContextProperty("alarmDateSet",&alarmDateSet);

    const QUrl url(u"qrc:/Clock/main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
