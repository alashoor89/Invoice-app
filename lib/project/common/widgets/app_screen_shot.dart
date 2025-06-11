import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';

class AppScreenShot extends HookWidget {
  final Widget child;

  const AppScreenShot({required this.child, super.key});

  @override
  Widget build(final BuildContext context) {
    if (!Platform.isWindows) {
      return child;
    }

    final controller = useMemoized(() => ScreenshotController());
    return Stack(
      children: [
        Screenshot(
          controller: controller,
          child: child,
        ),
        Positioned(
          bottom: 16.0,
          right: 16.0,
          child: ElevatedButton(
            onPressed: () async {
              final image = await controller.capture();
              if (image != null) {
                final document = getApplicationDocumentsDirectory();
                final directory = await document;
                final imagePath = '${directory.path}/screenshot-${DateTime.now().millisecondsSinceEpoch}.png';
                final file = File(imagePath);
                await file.writeAsBytes(image);
              }
            },
            child: const Text('Capture Screenshot'),
          ),
        ),
      ],
    );
  }
}
