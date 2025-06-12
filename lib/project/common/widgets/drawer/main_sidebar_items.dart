import 'package:flutter/material.dart';

import '../../../../gen/assets.gen.dart';
import '../../../core/router/routes.dart';
import '../../models/sidebar_item_model.dart';
import 'items/main_sidebar_item.dart';

class MainSidebarItems extends StatelessWidget {
  const MainSidebarItems({super.key});

  static final List<SidebarItemModel> items = List.unmodifiable([
    SidebarItemModel(
      title: 'Home',
      icon: Assets.icons.widget,
      route: Routes.home.path,
    ),
    SidebarItemModel(
      title: 'Invoices',
      icon: Assets.icons.description,
      route: '', // TODO implement invoices route
    ),
    SidebarItemModel(
      title: 'Customers',
      icon: Assets.icons.customers,
      route: '', // TODO implement customers route
    ),
    SidebarItemModel(
      title: 'Products',
      icon: Assets.icons.inventory,
      route: '', // TODO implement products route
    ),
    SidebarItemModel(
      title: 'Settings',
      icon: Assets.icons.settings,
      route: Routes.settings.path,
    ),
  ]);

  @override
  Widget build(final BuildContext context) {
    return ListView.separated(
      separatorBuilder: (final context, final index) => const SizedBox(height: 8),
      itemBuilder: (final context, final index) => MainSidebarItem(item: items[index]),
      itemCount: items.length,
    );
  }
}
