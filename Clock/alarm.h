#ifndef BOOLCONTROLS_H
#define BOOLCONTROLS_H

#include "qsoundeffect.h"
#include <QObject>
#include <QDateTime>
#include <QSoundEffect>

class Alarm : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool isThereAlarm   MEMBER isThereAlarm   NOTIFY onIsThereAlarmChanged)
    Q_PROPERTY(int  activeAlarms   MEMBER activeAlarms   NOTIFY onActiveAlarmsChanged)

    Q_PROPERTY(QDateTime date    READ getDate    NOTIFY onDateChanged)
    Q_PROPERTY(bool      dateSet READ getDateSet NOTIFY onDateSetChanged)

public:
    Alarm(QObject *parent=nullptr);

private:
    QDateTime date;
    bool dateSet=false;

    bool isThereAlarm=false;
    int activeAlarms=0;

    QSoundEffect * qSoundEffect = new QSoundEffect(this);
signals:
    void onDateChanged();
    void onDateSetChanged();

    void onIsThereAlarmChanged();
    void onActiveAlarmsChanged();
public slots:
    Q_INVOKABLE void newAlarm();

    Q_INVOKABLE void dateSetTime(int hours, int minutes);
    Q_INVOKABLE void dateAddDays(int days);
    QDateTime getDate();
    bool getDateSet();

    Q_INVOKABLE QDateTime assignDate();

    Q_INVOKABLE bool check(QDateTime d1, QDateTime d2, bool everyDay);

    Q_INVOKABLE void playSound();
};

#endif
