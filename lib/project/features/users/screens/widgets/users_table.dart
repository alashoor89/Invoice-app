import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../../core/utils/logger.dart';
import '../../../../vendors/syncfusion_flutter_datagrid/enhanced_grid_cell.dart';
import '../../../../vendors/syncfusion_flutter_datagrid/enhanced_grid_column.dart';
import '../../controllers/users_controller.dart';
import '../../enums/user_role.dart';
import '../../models/user_model.dart';
import 'table/users_actions_cell.dart';
import 'table/users_status_cell.dart';
import 'table/users_table_decoration.dart';

class UsersTable extends HookConsumerWidget {
  const UsersTable({super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final source = useMemoized(() => _UsersDataSource());
    final users = ref.watch(usersProvider); // TODO We will handle the async object later on (`This provider should be a FutureProvider`)
    final rowHeight = 50.0;
    final maxHeight = rowHeight * min(10, (users.length + 1)); // users + header row

    // Update the data source with the latest users, if they have changed, otherwise the internal body will ignore the call
    source.updateUsers(users);

    return UsersTableDecoration(
      maxHeight: maxHeight,
      dataGrid: SfDataGrid(
        source: source,
        rowHeight: rowHeight,
        onCellTap: (final details) {
          final index = details.rowColumnIndex.rowIndex - 1; // Adjust for header row
          if (index < 0) {
            return;
          }
          final user = users[index];
          user.d();
        },
        headerRowHeight: rowHeight,
        showVerticalScrollbar: false,
        allowSorting: true,
        columnWidthMode: ColumnWidthMode.fill,
        columns: [
          EnhancedGridColumn.text(columnName: 'name', label: 'Name'),
          EnhancedGridColumn.text(columnName: 'username', label: 'Username'),
          EnhancedGridColumn.text(columnName: 'role', label: 'Role'),
          EnhancedGridColumn.text(columnName: 'status', label: 'Status'),
          EnhancedGridColumn.text(columnName: 'actions', label: 'Actions', alignment: Alignment.centerLeft, width: 120.0, allowSorting: false),
        ],
      ),
    );
  }
}

class _UsersDataSource extends DataGridSource {
  List<DataGridRow> _rows = [];
  List<UserModel> _users = [];

  @override
  List<DataGridRow> get rows => _rows;

  void updateUsers(final List<UserModel> users) {
    if (users == _users) {
      // No change in users, no need to update
      return;
    }
    _users = users;
    _rows = _convertUsersToRows(users);
    notifyListeners();
  }

  List<DataGridRow> _convertUsersToRows(final List<UserModel> users) {
    return users.map((final user) {
      return DataGridRow(
        cells: [
          DataGridCell<String>(
            columnName: 'name',
            value: user.name,
          ),
          DataGridCell<String>(
            columnName: 'username',
            value: user.username,
          ),
          DataGridCell<UserRole>(
            columnName: 'role',
            value: user.role,
          ),
          DataGridCell<bool>(
            columnName: 'isActive',
            value: user.isActive,
          ),
        ],
      );
    }).toList();
  }

  @override
  int compare(final DataGridRow? a, final DataGridRow? b, final SortColumnDetails sortColumn) {
    if (a == null || b == null) {
      return super.compare(a, b, sortColumn);
    }

    final leftUser = _users[_rows.indexOf(a)];
    final rightUser = _users[_rows.indexOf(b)];
    final direction = sortColumn.sortDirection == DataGridSortDirection.ascending ? 1 : -1;

    return switch (sortColumn.name.toLowerCase()) {
      'role' => direction * leftUser.role.index.compareTo(rightUser.role.index),
      'status' => direction * (leftUser.isActive ? -1 : 1),
      _ => super.compare(a, b, sortColumn), // Default case if no match
    };
  }

  @override
  DataGridRowAdapter? buildRow(final DataGridRow row) {
    final index = _rows.indexOf(row);
    final user = _users[index];

    return DataGridRowAdapter(
      cells: [
        EnhancedGridCell.text(
          label: user.name,
        ),
        EnhancedGridCell.text(
          label: user.username,
        ),
        EnhancedGridCell.bubbleText(
          label: user.role.label,
          innerPadding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
          backgroundColor: Colors.grey.shade200,
          foregroundColor: Colors.grey,
        ),
        UsersStatusCell(user: user),
        UsersActionCell(user: user),
      ],
    );
  }
}
