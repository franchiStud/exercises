#include "date.h"

Date::Date(QObject *parent, bool isActive)
    : QObject{parent} {
    if(isActive){
        qTimer->setInterval(500);
        qTimer->setSingleShot(false);
        QObject::connect(qTimer, SIGNAL(timeout()), this, SLOT(refresh()));
        qTimer->start();
    }
}

void Date::refresh(){
    date=QDateTime::currentDateTime();
    emit onDateChanged();
}

void Date::assign(int h, int m){
    date.setTime(QTime::fromMSecsSinceStartOfDay(h*3600000+m*60000));
    emit onDateChanged();
}

void Date::addDays(int d){
    date=date.addDays(d);
    hasDateBeenSet=true;

    emit onHasDateBeenSetChanged();
    emit onDateChanged();
}
