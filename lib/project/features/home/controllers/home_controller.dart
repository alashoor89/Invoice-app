import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../interfaces/controllers.dart';

part 'home_controller.g.dart';

@Riverpod(keepAlive: true)
HomeController homeController(Ref ref) {
  return _HomeController(ref);
}

class _HomeController extends HomeController {
  final Ref _ref;

  _HomeController(this._ref);
}
