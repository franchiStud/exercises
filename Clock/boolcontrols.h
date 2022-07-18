#ifndef BOOLCONTROLS_H
#define BOOLCONTROLS_H

#include <QObject>

class BoolControls : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool isThereTimer   MEMBER isThereTimer   NOTIFY onIsThereTimerChanged)
    Q_PROPERTY(bool isTimerRunning MEMBER isTimerRunning NOTIFY onIsTimerRunningChanged)
    Q_PROPERTY(bool isThereAlarm   MEMBER isThereAlarm   NOTIFY onIsThereAlarmChanged)
    Q_PROPERTY(int  activeAlarms   MEMBER activeAlarms   NOTIFY onActiveAlarmsChanged)

public:
    BoolControls(QObject *parent=nullptr);

private:
    bool isThereTimer=false;
    bool isTimerRunning=true;
    bool isThereAlarm=false;
    int activeAlarms=0;
signals:
    void onIsThereTimerChanged();
    void onIsTimerRunningChanged();
    void onIsThereAlarmChanged();
    void onActiveAlarmsChanged();
};

#endif // BOOLCONTROLS_H
