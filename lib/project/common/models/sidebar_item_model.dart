import 'package:freezed_annotation/freezed_annotation.dart';

part 'sidebar_item_model.freezed.dart';

@freezed
abstract class SidebarItemModel with _$SidebarItemModel {
  const factory SidebarItemModel({
    required final String title,
    required final String icon,
    required final String route,
  }) = _SidebarItemModel;
}
