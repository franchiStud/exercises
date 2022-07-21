#include "timervalues.h"

TimerValues::TimerValues(QObject *parent)
    : QObject{parent} {
    qTimer->setInterval(10);
    qTimer->setSingleShot(false);
    QObject::connect(qTimer, SIGNAL(timeout()), this, SLOT(drainTime()));

    qSoundEffect->setSource(QUrl("qrc:/sounds/timer.wav"));
    qSoundEffect->setMuted(false);
    qSoundEffect->setLoopCount(0);
}

void TimerValues::setStartHours(int startHours){
    if(this->startHours==startHours) return;
    this->startHours=startHours;
    emit onStartHoursChanged();
}
void TimerValues::setStartMinutes(int startMinutes){
    if(this->startMinutes==startMinutes) return;
    this->startMinutes=startMinutes;
    emit onStartMinutesChanged();
}

void TimerValues::setIsThereTimer(bool isThereTimer){
    if(this->isThereTimer==isThereTimer) return;
    this->isThereTimer=isThereTimer;
    emit onIsThereTimerChanged();
}

void TimerValues::setIsTimerRunning(bool isTimerRunning){
    if(this->isTimerRunning==isTimerRunning) return;
    this->isTimerRunning=isTimerRunning;
    emit onIsTimerRunningChanged();
}

bool TimerValues::drainSeconds(){
    if(leftSeconds-- < 1){
        leftSeconds=59;
        emit onLeftSecondsChanged();
        return drainMinutes();
    }
    emit onLeftSecondsChanged();
    return true;
}

bool TimerValues::drainMinutes(){
    if(leftMinutes-- < 1){
        leftMinutes=59;
        emit onLeftMinutesChanged();
        return drainHours();
    }
    emit onLeftMinutesChanged();
    return true;
}

bool TimerValues::drainHours(){
    leftHours--;
    emit onLeftHoursChanged();
    return leftHours >= 0;
}

void TimerValues::resetTimeLeft(){
    leftHours=0;
    leftMinutes=0;
    leftSeconds=0;

    emit onLeftHoursChanged();
    emit onLeftMinutesChanged();
    emit onLeftSecondsChanged();
}

void TimerValues::drainTime() {
    if(!drainSeconds()){
        qSoundEffect->play();

        setIsThereTimer(false);
        setIsTimerRunning(false);

        qTimer->stop();

        resetTimeLeft();
    }
}

void TimerValues::start(int startHours, int startMinutes){
    setStartHours(startHours);
    setStartMinutes(startMinutes);

    reset();

    setIsThereTimer(true);
    setIsTimerRunning(true);
}
void TimerValues::pause(){
    if(isTimerRunning) {
        qTimer->stop();
        setIsTimerRunning(false);
    } else {
        qTimer->start();
        setIsTimerRunning(true);
    }
}
void TimerValues::reset(){
    if(qTimer->isActive())
        qTimer->stop();

    leftHours=startHours;
    leftMinutes=startMinutes;
    leftSeconds=0;

    emit onLeftHoursChanged();
    emit onLeftMinutesChanged();
    emit onLeftSecondsChanged();

    qTimer->start();
}

bool TimerValues::getIsThereTimer()   { return isThereTimer; }
bool TimerValues::getIsTimerRunning() { return isTimerRunning; }
int  TimerValues::getStartHours()     { return startHours; }
int  TimerValues::getStartMinutes()   { return startMinutes; }
int  TimerValues::getLeftHours()      { return leftHours; }
int  TimerValues::getLeftMinutes()    { return leftMinutes; }
int  TimerValues::getLeftSeconds()    { return leftSeconds; }
