import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums/user_role.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    required final String name,
    required final String username,
    required final UserRole role,
    @Default(false) final bool isActive,
  }) = _UserModel;

  factory UserModel.fromJson(final Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}