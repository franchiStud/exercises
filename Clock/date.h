#ifndef DATE_H
#define DATE_H

#include <QObject>
#include <QDateTime>
#include <QTimer>

class Date : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QDateTime date MEMBER date NOTIFY onDateChanged)
    Q_PROPERTY(bool hasDateBeenSet MEMBER hasDateBeenSet NOTIFY onHasDateBeenSetChanged)
public:
    explicit Date(QObject *parent = nullptr, bool isActive=true);

private:
    QDateTime date = QDateTime::currentDateTime();
    QTimer *qTimer = new QTimer();

    bool hasDateBeenSet = false;
signals:
    void onDateChanged();
    void onHasDateBeenSetChanged();
public slots:
    void refresh();
    void assign(int h, int m);
    void addDays(int d);
};

#endif // DATE_H
