import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'project/common/enums/app_state.dart';
import 'project/common/widgets/app_screen_shot.dart';
import 'project/core/app_provider.dart';
import 'project/core/router/router.dart';
import 'project/core/theme/palette.dart';
import 'project/core/utils/logger.dart';

void main() async {
  runZonedGuarded(
    () async {
      final binding = WidgetsFlutterBinding.ensureInitialized();
      final container = ProviderContainer();

      if (kIsWeb) {
        usePathUrlStrategy();
      }

      // Preserve the splash screen on web/mobile apps and initialize the app
      if (kIsWeb || !(Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
        FlutterNativeSplash.preserve(widgetsBinding: binding);
        await container.read(appProvider).init();
        FlutterNativeSplash.remove();
      }

      runApp(
        UncontrolledProviderScope(
          container: container,
          child: const MyApp(),
        ),
      );
    },
    (final error, final stack) {
      // TODO handle errors
    },
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();
    // Before building the app, and initialize the router
    // Check if the app is in loading state the case for desktop apps that doesn't have any splash screen
    // Call the App#init method to initialize the app and subscribe to it and switch to home if the app is ready
    // Remember that loading state will only show if the app is running on desktop platforms (if app in loading state and not in the cases we have then it is a problem/bug)
    final appState = ref.read(appStateProvider);

    'App state is $appState'.d();

    if (appState == AppState.loading) {
      ref.read(appProvider).init().then(
        (_) {
          // After the app is initialized, Two cases occur:
          // 1. App Initialize before context is fully built, if we don't wait for the first frame to be built, state error may occur
          // 2. App Initialize after context is fully built, No state error will occur,
          // We use WidgetsBinding.instance.addPostFrameCallback to wait for the first frame to be built,
          // even if the second case occurs (Guarantees that the context is fully built) and no state problems occurs
          WidgetsBinding.instance.addPostFrameCallback((final timeStamp) {
            if (!mounted) {
              return;
            }
            'Refreshing router after app initialization'.d();
            ref.read(goRouterProvider).refresh();
          });
        },
      );
    }
  }

  @override
  Widget build(final BuildContext context) {
    final palette = ref.watch(paletteProvider);
    final router = ref.watch(goRouterProvider);
    return MaterialApp.router(
      theme: palette.theme,
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      builder: (final context, final child) {
        return ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: AppScreenShot(child: child!),
        );
      },
    );
  }
}
