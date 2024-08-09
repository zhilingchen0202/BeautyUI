#include "BTreeModel.h"

#include <QMetaEnum>

BTreeNode::BTreeNode(QObject *parent) : QObject{parent} {
}

BTreeModel::BTreeModel(QObject *parent) : QAbstractTableModel{parent} {
    _dataSourceSize = 0;
}

int BTreeModel::rowCount(const QModelIndex &parent) const {
    return _rows.count();
}

int BTreeModel::columnCount(const QModelIndex &parent) const {
    return this->_columnSource.size();
}

QVariant BTreeModel::data(const QModelIndex &index, int role) const {
    switch (role) {
        case TreeModelRoles::RowModel:
            return QVariant::fromValue(_rows.at(index.row()));
        case TreeModelRoles::ColumnModel:
            return QVariant::fromValue(_columnSource.at(index.column()));
        default:
            break;
    }
    return {};
}

QHash<int, QByteArray> BTreeModel::roleNames() const {
    return {
        {TreeModelRoles::RowModel,    "rowModel"   },
        {TreeModelRoles::ColumnModel, "columnModel"}
    };
}

void BTreeModel::setData(QList<BTreeNode *> data) {
    beginResetModel();
    _rows = std::move(data);
    endResetModel();
}

void BTreeModel::removeRows(int row, int count) {
    if (row < 0 || row + count > _rows.size() || count == 0)
        return;
    beginRemoveRows(QModelIndex(), row, row + count - 1);
    QList<BTreeNode *> firstPart = _rows.mid(0, row);
    QList<BTreeNode *> secondPart = _rows.mid(row + count);
    _rows.clear();
    _rows.append(firstPart);
    _rows.append(secondPart);
    endRemoveRows();
}

void BTreeModel::insertRows(int row, const QList<BTreeNode *> &data) {
    if (row < 0 || row > _rows.size() || data.empty())
        return;
    beginInsertRows(QModelIndex(), row, row + data.size() - 1);
    QList<BTreeNode *> firstPart = _rows.mid(0, row);
    QList<BTreeNode *> secondPart = _rows.mid(row);
    _rows.clear();
    _rows.append(firstPart);
    _rows.append(data);
    _rows.append(secondPart);
    endInsertRows();
}

QObject *BTreeModel::getRow(int row) {
    return _rows.at(row);
}

void BTreeModel::setRow(int row, QVariantMap data) {
    _rows.at(row)->_data = std::move(data);
    Q_EMIT dataChanged(index(row, 0), index(row, columnCount() - 1));
}

void BTreeModel::checkRow(int row, bool checked) {
    auto itemData = _rows.at(row);
    if (itemData->hasChildren()) {
        QList<BTreeNode *> stack = itemData->_children;
        std::reverse(stack.begin(), stack.end());
        while (stack.count() > 0) {
            auto item = stack.at(stack.count() - 1);
            stack.pop_back();
            if (!item->hasChildren()) {
                item->_checked = checked;
            }
            QList<BTreeNode *> children = item->_children;
            if (!children.isEmpty()) {
                std::reverse(children.begin(), children.end());
                foreach (auto c, children) {
                    stack.append(c);
                }
            }
        }
    } else {
        if (itemData->_checked == checked) {
            return;
        }
        itemData->_checked = checked;
    }
    Q_EMIT dataChanged(index(0, 0), index(rowCount() - 1, 0));
}

void BTreeModel::setDataSource(QList<QMap<QString, QVariant>> data) {
    _dataSource.clear();
    if (_root) {
        delete _root;
        _root = nullptr;
    }
    _root = new BTreeNode(this);
    std::reverse(data.begin(), data.end());
    while (data.count() > 0) {
        auto item = data.at(data.count() - 1);
        data.pop_back();
        auto *node = new BTreeNode(this);
        node->_depth = item.value("__depth").toInt();
        node->_parent = item.value("__parent").value<BTreeNode *>();
        node->_data = item;
        node->_isExpanded = true;
        if (node->_parent) {
            node->_parent->_children.append(node);
        } else {
            node->_parent = _root;
            _root->_children.append(node);
        }
        _dataSource.append(node);
        if (item.contains("children")) {
            QList<QVariant> children = item.value("children").toList();
            if (!children.isEmpty()) {
                std::reverse(children.begin(), children.end());
                for (int i = 0; i <= children.count() - 1; ++i) {
                    auto child = children.at(i).toMap();
                    child.insert("__depth", item.value("__depth").toInt(nullptr) + 1);
                    child.insert("__parent", QVariant::fromValue(node));
                    data.append(child);
                }
            }
        }
    }
    beginResetModel();
    _rows = _dataSource;
    endResetModel();
    dataSourceSize(_dataSource.size());
}

void BTreeModel::collapse(int row) {
    if (!_rows.at(row)->_isExpanded) {
        return;
    }
    _rows.at(row)->_isExpanded = false;
    Q_EMIT dataChanged(index(row, 0), index(row, 0));
    auto modelData = _rows.at(row);
    int removeCount = 0;
    for (int i = row + 1; i < _rows.count(); i++) {
        auto obj = _rows[i];
        if (obj->_depth <= modelData->_depth) {
            break;
        }
        removeCount = removeCount + 1;
    }
    removeRows(row + 1, removeCount);
}

void BTreeModel::expand(int row) {
    if (_rows.at(row)->_isExpanded) {
        return;
    }
    _rows.at(row)->_isExpanded = true;
    Q_EMIT dataChanged(index(row, 0), index(row, 0));
    auto modelData = _rows.at(row);
    QList<BTreeNode *> insertData;
    QList<BTreeNode *> stack = modelData->_children;
    std::reverse(stack.begin(), stack.end());
    while (stack.count() > 0) {
        auto item = stack.at(stack.count() - 1);
        stack.pop_back();
        if (item->isShown()) {
            insertData.append(item);
        }
        QList<BTreeNode *> children = item->_children;
        if (!children.isEmpty()) {
            std::reverse(children.begin(), children.end());
            foreach (auto c, children) {
                stack.append(c);
            }
        }
    }
    insertRows(row + 1, insertData);
}

bool BTreeModel::hitHasChildrenExpanded(int row) {
    auto itemData = _rows.at(row);
    if (itemData->hasChildren() && itemData->_isExpanded) {
        return true;
    }
    return false;
}

void BTreeModel::refreshNode(int row) {
    Q_EMIT dataChanged(index(row, 0), index(row, 0));
}

BTreeNode *BTreeModel::getNode(int row) {
    return _rows.at(row);
}

void BTreeModel::allExpand() {
    beginResetModel();
    QList<BTreeNode *> data;
    QList<BTreeNode *> stack = _root->_children;
    std::reverse(stack.begin(), stack.end());
    while (stack.count() > 0) {
        auto item = stack.at(stack.count() - 1);
        stack.pop_back();
        if (item->hasChildren()) {
            item->_isExpanded = true;
        }
        data.append(item);
        QList<BTreeNode *> children = item->_children;
        if (!children.isEmpty()) {
            std::reverse(children.begin(), children.end());
            foreach (auto c, children) {
                stack.append(c);
            }
        }
    }
    _rows = data;
    endResetModel();
}

void BTreeModel::allCollapse() {
    beginResetModel();
    QList<BTreeNode *> stack = _root->_children;
    std::reverse(stack.begin(), stack.end());
    while (stack.count() > 0) {
        auto item = stack.at(stack.count() - 1);
        stack.pop_back();
        if (item->hasChildren()) {
            item->_isExpanded = false;
        }
        QList<BTreeNode *> children = item->_children;
        if (!children.isEmpty()) {
            std::reverse(children.begin(), children.end());
            foreach (auto c, children) {
                stack.append(c);
            }
        }
    }
    _rows = _root->_children;
    endResetModel();
}

QVariant BTreeModel::selectionModel() {
    QList<BTreeNode *> data;
    foreach (auto item, _dataSource) {
        if (item->checked()) {
            data.append(item);
        }
    }
    return QVariant::fromValue(data);
}
