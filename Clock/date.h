#ifndef DATE_H
#define DATE_H

#include <QObject>
#include <QDateTime>
#include <QTimer>

class Date : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QDateTime date MEMBER date NOTIFY onDateChanged)
public:
    explicit Date(QObject *parent = nullptr, bool isActive=true);

private:
    QDateTime date = QDateTime::currentDateTime();
    QTimer *qTimer = new QTimer();
signals:
    void onDateChanged();
public slots:
    void refresh();
};

#endif // DATE_H
