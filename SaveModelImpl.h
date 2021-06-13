#ifndef TABLEVIEWER_H
#define TABLEVIEWER_H

#include <QObject>

class SaveModelImpl : public QObject
{
    Q_OBJECT
public:
    Q_INVOKABLE void saveToFile(QVector<QString> data);
};

#endif // TABLEVIEWER_H
