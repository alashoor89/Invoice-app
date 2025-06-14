import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../../../core/theme/palette.dart';
import '../../../../../vendors/syncfusion_flutter_datagrid/data_grid_border_clipper.dart';

class UsersTableDecoration extends ConsumerWidget {
  final SfDataGrid dataGrid;
  final double maxHeight;

  const UsersTableDecoration({
    required this.dataGrid,
    required this.maxHeight,
    super.key,
  });

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final palette = ref.watch(paletteProvider);
    return Container(
      constraints: BoxConstraints(
        maxWidth: 1200.0,
        maxHeight: maxHeight, // 10 rows
      ),
      decoration: BoxDecoration(
        color: palette.backgroundAlt,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: palette.primary.withValues(alpha: 0.1),
            blurRadius: 8.0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRect(
        clipper: const DataGridBorderClipper(),
        child: SfDataGridTheme(
          data: SfDataGridThemeData(
            headerColor: palette.lightGrey,
            gridLineStrokeWidth: 0,
            gridLineColor: palette.lightGrey,
          ),
          child: dataGrid,
        ),
      ),
    );
  }
}
