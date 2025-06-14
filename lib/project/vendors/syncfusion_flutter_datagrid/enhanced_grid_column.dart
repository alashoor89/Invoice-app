import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class EnhancedGridColumn extends GridColumn {
  EnhancedGridColumn({
    required super.columnName,
    required super.label,
    super.columnWidthMode = ColumnWidthMode.none,
    super.visible = true,
    super.allowSorting = true,
    super.sortIconPosition = ColumnHeaderIconPosition.end,
    super.filterIconPosition = ColumnHeaderIconPosition.end,
    super.autoFitPadding = const EdgeInsets.all(16.0),
    super.minimumWidth = double.nan,
    super.maximumWidth = double.nan,
    super.width = double.nan,
    super.allowEditing = true,
    super.allowFiltering = true,
    super.filterPopupMenuOptions,
    super.filterIconPadding = const EdgeInsets.symmetric(horizontal: 8.0),
  });

  factory EnhancedGridColumn.text({
    required final String columnName,
    required final String label,
    final ColumnWidthMode columnWidthMode = ColumnWidthMode.fill,
    final AlignmentGeometry alignment = Alignment.centerLeft,
    final TextStyle? textStyle,
    final double width = double.nan,
    final bool allowSorting = true,
  }) {
    return EnhancedGridColumn(
      columnName: columnName,
      columnWidthMode: columnWidthMode,
      width: width,
      allowSorting: allowSorting,
      label: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          padding: const EdgeInsetsDirectional.only(start: 16),
          alignment: alignment,
          child: DefaultTextStyle(
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
            child: Text(
              label,
              overflow: TextOverflow.ellipsis,
              style: textStyle,
            ),
          ),
        ),
      ),
    );
  }
}
