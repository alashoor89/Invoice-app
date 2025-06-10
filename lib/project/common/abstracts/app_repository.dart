import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class AppRepository {
  final Ref _ref;

  AppRepository(this._ref);

  @protected
  Ref get ref => _ref;
}
