#include "alarm.h"

Alarm::Alarm(QObject *parent)
    : QObject{parent} {
    date.setDate(QDate::currentDate());
    dateSetTime(6,0);

    qSoundEffect->setSource(QUrl("qrc:/sounds/alarm.wav"));
    qSoundEffect->setMuted(false);
    qSoundEffect->setLoopCount(0);
}

void Alarm::newAlarm(){
    isThereAlarm=true;
    activeAlarms++;

    emit onIsThereAlarmChanged();
    emit onActiveAlarmsChanged();
}

void Alarm::dateSetTime(int hours, int minutes){
    date.setTime(QTime::fromMSecsSinceStartOfDay(hours*3600000+
                                                 minutes*60000));
    emit onDateChanged();
}

void Alarm::dateAddDays(int days){
    if(date.addDays(days).date()>=QDate::currentDate())
        date=date.addDays(days);
    dateSet=true;
    emit onDateChanged();
    emit onDateSetChanged();
}

QDateTime Alarm::getDate()    { return date; }
bool      Alarm::getDateSet() { return dateSet; }
QDateTime Alarm::assignDate() { return date; }

bool Alarm::check(QDateTime d1, QDateTime d2, bool everyDay){
    return ((everyDay&&d1.toString("h:m")==      d2.toString("h:m"))
            ||d1.toString("h:m d:M:y")==d2.toString("h:m d:M:y"));
}

void Alarm::playSound(){
    qSoundEffect->play();
}

