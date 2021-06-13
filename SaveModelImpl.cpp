#include "SaveModelImpl.h"
#include <QFileDialog>
#include <QTextStream>
#include <QDebug>

#include <string>
#include <algorithm>
#include <iostream>
#include <fstream>

void SaveModelImpl::saveToFile(QVector<QString> data)
{
    QString filename = QFileDialog::getOpenFileName(nullptr, tr("Save File"), "", tr("All files (*.*)"));
    std::ofstream write(filename.toStdString(), std::ios::out | std::ios::binary);

    if (!write.is_open()) {
        write.close();
        return;
    } else {
        std::string src{};
        std::string subStr{};
        size_t pos;

        write.clear();
        foreach (QString str, data) {
            src = str.toStdString();
            pos = src.find('f');
            subStr = src.substr(pos, src.size() - 1);
            src.erase(pos, src.size() - 1);
            pos = subStr.find("block_");
            subStr = subStr.substr(pos, subStr.size() - 1);
            src += subStr;
            write << src << std::endl;
        }

        write.close();
    }
}

