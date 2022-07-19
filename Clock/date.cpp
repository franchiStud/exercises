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
