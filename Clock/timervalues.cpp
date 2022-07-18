#include "timervalues.h"

TimerValues::TimerValues(QObject *parent)
    : QObject{parent} {}

bool TimerValues::drainTime(){
    if(leftSeconds <1){

        if(leftMinutes < 1)

            if(leftHours < 1){
                return true;
            } else {
                leftHours--;
                leftMinutes=59;
                leftSeconds=59;

                emit onLeftHoursChanged();
                emit onLeftMinutesChanged();
                emit onLeftSecondsChanged();
            }
        else {
            leftMinutes--;
            leftSeconds=59;

            emit onLeftMinutesChanged();
            emit onLeftSecondsChanged();
        }

    } else {
        leftSeconds--;

        emit onLeftSecondsChanged();
    }
    return false;
}
