#ifndef TIMERVALUES_H
#define TIMERVALUES_H

#include <QObject>

class TimerValues : public QObject
{
    Q_OBJECT

    Q_PROPERTY(int startHours   MEMBER startHours   NOTIFY onStartHoursChanged)
    Q_PROPERTY(int startMinutes MEMBER startMinutes NOTIFY onStartMinutesChanged)

    Q_PROPERTY(int leftHours   MEMBER leftHours   NOTIFY onLeftHoursChanged)
    Q_PROPERTY(int leftMinutes MEMBER leftMinutes NOTIFY onLeftMinutesChanged)
    Q_PROPERTY(int leftSeconds MEMBER leftSeconds NOTIFY onLeftSecondsChanged)
public:
    explicit TimerValues(QObject *parent=nullptr);

private:
    int startHours=0;
    int startMinutes=0;

    int leftHours=0;
    int leftMinutes=0;
    int leftSeconds=0;
signals:
    void onStartHoursChanged();
    void onStartMinutesChanged();

    void onLeftHoursChanged();
    void onLeftMinutesChanged();
    void onLeftSecondsChanged();
public slots:
    Q_INVOKABLE bool drainTime();
};

#endif // TIMERVALUES_H
