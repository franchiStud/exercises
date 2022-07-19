#ifndef TIMERVALUES_H
#define TIMERVALUES_H

#include <QObject>
#include <QTimer>

class TimerValues : public QObject
{
    Q_OBJECT

    Q_PROPERTY(int startHours   MEMBER startHours   NOTIFY onStartHoursChanged)
    Q_PROPERTY(int startMinutes MEMBER startMinutes NOTIFY onStartMinutesChanged)

    Q_PROPERTY(int leftHours    MEMBER leftHours    NOTIFY onLeftHoursChanged)
    Q_PROPERTY(int leftMinutes  MEMBER leftMinutes  NOTIFY onLeftMinutesChanged)
    Q_PROPERTY(int leftSeconds  MEMBER leftSeconds  NOTIFY onLeftSecondsChanged)

    Q_PROPERTY(bool isThereTimer   MEMBER isThereTimer   NOTIFY onIsThereTimerChanged)
    Q_PROPERTY(bool isTimerRunning MEMBER isTimerRunning NOTIFY onIsTimerRunningChanged)
public:
    explicit TimerValues(QObject *parent=nullptr);

private:
    int startHours=0;
    int startMinutes=0;

    int leftHours=0;
    int leftMinutes=0;
    int leftSeconds=0;

    bool isThereTimer=false;
    bool isTimerRunning=false;

    QTimer *qTimer=new QTimer(this);;

signals:
    void onStartHoursChanged();
    void onStartMinutesChanged();

    void onLeftHoursChanged();
    void onLeftMinutesChanged();
    void onLeftSecondsChanged();

    void onIsThereTimerChanged();
    void onIsTimerRunningChanged();

public slots:
    void drainTime();

    Q_INVOKABLE void start();
    Q_INVOKABLE void pause();
    Q_INVOKABLE void reset();
};

#endif // TIMERVALUES_H
