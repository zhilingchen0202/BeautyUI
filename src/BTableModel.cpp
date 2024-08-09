#include "BTableModel.h"

BTableModel::BTableModel(QObject *parent) : QAbstractTableModel{parent} {
}

int BTableModel::rowCount(const QModelIndex &parent) const {
    return _rows.count();
}


int BTableModel::columnCount(const QModelIndex &parent) const {
    return this->_columnSource.size();
}

QVariant BTableModel::data(const QModelIndex &index, int role) const {
    switch (role) {
        case BTableModel::RowModel:
            return QVariant::fromValue(_rows.at(index.row()));
        case BTableModel::ColumnModel:
            return QVariant::fromValue(_columnSource.at(index.column()));
        default:
            break;
    }
    return {};
}

QHash<int, QByteArray> BTableModel::roleNames() const {
    return {
        {BTableModel::RowModel,    "rowModel"   },
        {BTableModel::ColumnModel, "columnModel"}
    };
}

void BTableModel::clear() {
    beginResetModel();
    this->_rows.clear();
    endResetModel();
}

QVariant BTableModel::getRow(int rowIndex) {
    return _rows.at(rowIndex);
}

void BTableModel::setRow(int rowIndex, QVariant row) {
    _rows.replace(rowIndex, row.toMap());
    Q_EMIT dataChanged(index(rowIndex, 0), index(rowIndex, columnCount() - 1));
}

void BTableModel::insertRow(int rowIndex, QVariant row) {
    beginInsertRows(QModelIndex(), rowIndex, rowIndex);
    _rows.insert(rowIndex, row.toMap());
    endInsertRows();
}

void BTableModel::removeRow(int rowIndex, int rows) {
    beginRemoveRows(QModelIndex(), rowIndex, rowIndex + rows - 1);
    _rows = _rows.mid(0, rowIndex) + _rows.mid(rowIndex + rows);
    endRemoveRows();
}

void BTableModel::appendRow(QVariant row) {
    insertRow(rowCount(), row);
}
