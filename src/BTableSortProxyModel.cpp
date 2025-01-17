#include "BTableSortProxyModel.h"

#include <QJSValueList>

BTableSortProxyModel::BTableSortProxyModel(QSortFilterProxyModel *parent)
    : QSortFilterProxyModel{parent} {
    connect(this, &BTableSortProxyModel::modelChanged, this,
            [=] { setSourceModel(this->model().value<QAbstractTableModel *>()); });
}

bool BTableSortProxyModel::filterAcceptsRow(int source_row,
                                              const QModelIndex &source_parent) const {
    QJSValue filter = _filter;
    if (filter.isUndefined()) {
        return true;
    }
    QJSValueList data;
    data << source_row;
    return filter.call(data).toBool();
}

bool BTableSortProxyModel::filterAcceptsColumn(int source_column,
                                                 const QModelIndex &source_parent) const {
    return true;
}

bool BTableSortProxyModel::lessThan(const QModelIndex &source_left,
                                      const QModelIndex &source_right) const {
    QJSValue comparator = _comparator;
    if (comparator.isUndefined()) {
        return true;
    }
    QJSValueList data;
    data << source_left.row();
    data << source_right.row();
    bool flag = comparator.call(data).toBool();
    if (sortOrder() == Qt::AscendingOrder) {
        return !flag;
    } else {
        return flag;
    }
}

[[maybe_unused]] void BTableSortProxyModel::setComparator(const QJSValue &comparator) {
    int column = 0;
    if (comparator.isUndefined()) {
        column = -1;
    }
    this->_comparator = comparator;
    if (sortOrder() == Qt::AscendingOrder) {
        sort(column, Qt::DescendingOrder);
    } else {
        sort(column, Qt::AscendingOrder);
    }
}

[[maybe_unused]] void BTableSortProxyModel::setFilter(const QJSValue &filter) {
    this->_filter = filter;
    invalidateFilter();
}

[[maybe_unused]] QVariant BTableSortProxyModel::getRow(int rowIndex) {
    QVariant result;
    QMetaObject::invokeMethod(_model.value<QAbstractTableModel *>(), "getRow",
                              Q_RETURN_ARG(QVariant, result),
                              Q_ARG(int, mapToSource(index(rowIndex, 0)).row()));
    return result;
}

[[maybe_unused]] void BTableSortProxyModel::setRow(int rowIndex, const QVariant &val) {
    QMetaObject::invokeMethod(_model.value<QAbstractTableModel *>(), "setRow",
                              Q_ARG(int, mapToSource(index(rowIndex, 0)).row()),
                              Q_ARG(QVariant, val));
}

[[maybe_unused]] void BTableSortProxyModel::insertRow(int rowIndex, const QVariant &val) {
    QMetaObject::invokeMethod(_model.value<QAbstractTableModel *>(), "insertRow",
                              Q_ARG(int, mapToSource(index(rowIndex, 0)).row()),
                              Q_ARG(QVariant, val));
}

[[maybe_unused]] void BTableSortProxyModel::removeRow(int rowIndex, int rows) {
    QMetaObject::invokeMethod(_model.value<QAbstractTableModel *>(), "removeRow",
                              Q_ARG(int, mapToSource(index(rowIndex, 0)).row()), Q_ARG(int, rows));
}
