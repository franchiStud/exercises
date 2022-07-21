#ifndef TIMERVALUES_H
#define TIMERVALUES_H

#include <QObject>
#include <QTimer>
#include <QSoundEffect>
#include <QUrl>

class TimerValues : public QObject
{
    Q_OBJECT

    Q_PROPERTY(int startHours    READ getStartHours    NOTIFY onStartHoursChanged)
    Q_PROPERTY(int startMinutes  READ getStartMinutes  NOTIFY onStartMinutesChanged)

    Q_PROPERTY(int leftHours    READ getLeftHours    NOTIFY onLeftHoursChanged)
    Q_PROPERTY(int leftMinutes  READ getLeftMinutes  NOTIFY onLeftMinutesChanged)
    Q_PROPERTY(int leftSeconds  READ getLeftSeconds  NOTIFY onLeftSecondsChanged)

    Q_PROPERTY(bool isThereTimer   READ getIsThereTimer   NOTIFY onIsThereTimerChanged)
    Q_PROPERTY(bool isTimerRunning READ getIsTimerRunning NOTIFY onIsTimerRunningChanged)
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

    void setStartHours(int startHours);
    void setStartMinutes(int startMinutes);

    void setIsThereTimer(bool isThereTimer);
    void setIsTimerRunning(bool isTimerRunning);

    bool drainSeconds();
    bool drainMinutes();
    bool drainHours();

    void resetTimeLeft();

    QTimer *qTimer=new QTimer(this);
    QSoundEffect *qSoundEffect=new QSoundEffect(this);

signals:
    void onStartHoursChanged();
    void onStartMinutesChanged();

    void onLeftHoursChanged();
    void onLeftMinutesChanged();
    void onLeftSecondsChanged();

    void onIsThereTimerChanged();
    void onIsTimerRunningChanged();

private slots:
    void drainTime();
public slots:
    Q_INVOKABLE void start(int startHours, int startMinutes);
    Q_INVOKABLE void pause();
    Q_INVOKABLE void reset();

    bool getIsThereTimer();
    bool getIsTimerRunning();
    int getStartHours();
    int getStartMinutes();
    int getLeftHours();
    int getLeftMinutes();
    int getLeftSeconds();
};

#endif // TIMERVALUES_H
