#ifndef DATE_H
#define DATE_H

#include <QObject>

class Date : public QObject
{
    Q_OBJECT

    Q_PROPERTY(int minutes MEMBER minutes NOTIFY onMinutesChanged)
    Q_PROPERTY(int hours   MEMBER hours   NOTIFY onHoursChanged)

    Q_PROPERTY(int day     MEMBER day     NOTIFY onDayChanged)
    Q_PROPERTY(int date    MEMBER date    NOTIFY onDateChanged)
    Q_PROPERTY(int month   MEMBER month   NOTIFY onMonthChanged)
    Q_PROPERTY(int year    MEMBER year    NOTIFY onYearChanged)

public:
    explicit Date(QObject *parent = nullptr);

private:
    int minutes=0;
    int hours=6;

    int day=0;
    int date=0;
    int month=0;
    int year=0;
signals:
    void onMinutesChanged();
    void onHoursChanged();

    void onDayChanged();
    void onDateChanged();
    void onMonthChanged();
    void onYearChanged();
};

#endif // DATE_H
