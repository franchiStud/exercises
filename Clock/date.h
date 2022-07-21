#ifndef DATE_H
#define DATE_H

#include <QObject>
#include <QDateTime>
#include <QTimer>

class Date : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QDateTime date READ getDate NOTIFY onDateChanged)
public:
    explicit Date(QObject *parent = nullptr, bool isActive=true);

private:
    QDateTime date = QDateTime::currentDateTime();
    QTimer *qTimer = new QTimer(this);

signals:
    void onDateChanged();

private slots:
    void refresh();
public slots:
    QDateTime getDate();
};

#endif // DATE_H
