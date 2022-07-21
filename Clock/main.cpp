#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "alarm.h"
#include "timervalues.h"
#include "date.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    Alarm alarms;
    TimerValues timerValues;
    Date date;

    QQmlApplicationEngine engine;
    QQmlContext * context = engine.rootContext();

    context->setContextProperty("alarms",&alarms);
    context->setContextProperty("timerValues",&timerValues);
    context->setContextProperty("currentDate",&date);

    const QUrl url(u"qrc:/Clock/main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
