#include "timervalues.h"

TimerValues::TimerValues(QObject *parent)
    : QObject{parent} {}

void TimerValues::drainTime() {
    if(leftSeconds <1) {

        if(leftMinutes < 1) {

            if(leftHours < 1) {
                isThereTimer=false;
                isTimerRunning=false;

                emit onIsThereTimerChanged();
                emit onIsTimerRunningChanged();
            } else {
                leftHours--;
                leftMinutes=59;
                leftSeconds=59;

                emit onLeftHoursChanged();
                emit onLeftMinutesChanged();
                emit onLeftSecondsChanged();
            }
        } else {
            leftMinutes--;
            leftSeconds=59;

            emit onLeftMinutesChanged();
            emit onLeftSecondsChanged();
        }

    } else {
        leftSeconds--;

        emit onLeftSecondsChanged();
    }
}

void TimerValues::start(){
    leftHours=startHours;
    leftMinutes=startMinutes;
    leftSeconds=0;

    emit onLeftHoursChanged();
    emit onLeftMinutesChanged();
    emit onLeftSecondsChanged();

    qTimer->setInterval(1000);
    qTimer->setSingleShot(false);
    QObject::connect(qTimer, SIGNAL(timeout()), this, SLOT(drainTime()));
    qTimer->start();

    isThereTimer=true;
    isTimerRunning=true;

    emit onIsThereTimerChanged();
    emit onIsTimerRunningChanged();
}
void TimerValues::pause(){
    if(isTimerRunning) {
        qTimer->stop();
        isTimerRunning=false;
    } else {
        qTimer->start();
        isTimerRunning=true;
    }
    emit onIsTimerRunningChanged();
}
void TimerValues::reset(){
    qTimer->stop();

    leftHours=startHours;
    leftMinutes=startMinutes;
    leftSeconds=0;

    emit onLeftHoursChanged();
    emit onLeftMinutesChanged();
    emit onLeftSecondsChanged();

    qTimer->start();
}
