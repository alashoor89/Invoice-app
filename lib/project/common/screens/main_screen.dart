import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../extensions.dart';
import '../widgets/drawer/main_appbar.dart';
import '../widgets/drawer/main_sidebar.dart';

class MainScreen extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainScreen({
    required this.navigationShell,
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final breakpoint = size.width > 700;

    return Scaffold(
      drawer: breakpoint.inverseOrNull(
        const Drawer(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
          width: 280,
          child: MainSidebar(),
        ),
      ),
      appBar: breakpoint.inverseOrNull(const MainAppBar()),
      body: Row(
        children: [
          if (breakpoint) const SizedBox(width: 280, child: MainSidebar()),
          Expanded(child: navigationShell),
        ],
      ),
    );
  }
}
