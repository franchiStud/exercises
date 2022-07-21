#include "alarm.h"

Alarm::Alarm(QObject *parent)
    : QObject{parent} {
    date.setDate(QDate::currentDate());
    dateSetTime(6,0);
}

void Alarm::newAlarm(){
    isThereAlarm=true;
    activeAlarms++;

    emit onIsThereAlarmChanged();
    emit onActiveAlarmsChanged();
}

void Alarm::dateSetTime(int hours, int minutes){
    date.setTime(QTime::fromMSecsSinceStartOfDay(hours*3600000+minutes*60000));
    emit onDateChanged();
}

void Alarm::dateAddDays(int days){
    date=date.addDays(days);
    dateSet=true;
    emit onDateChanged();
    emit onDateSetChanged();
}

QDateTime Alarm::getDate()    { return date; }
bool      Alarm::getDateSet() { return dateSet; }
QDateTime Alarm::assignDate() { return date; }
