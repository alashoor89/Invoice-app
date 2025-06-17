import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums/user_role.dart';
import 'user_model.dart';

part 'users_form_model.freezed.dart';
part 'users_form_model.g.dart';

@freezed
abstract class UsersFormModel with _$UsersFormModel {
  const factory UsersFormModel({
    @Default('') final String fullName,
    @Default('') final String username,
    @Default('') final String pin,
    @Default(null) final UserRole? role,
    @Default(false) final bool active,
  }) = _UsersFormModel;

  factory UsersFormModel.fromJson(final Map<String, dynamic> json) => _$UsersFormModelFromJson(json);

  factory UsersFormModel.fromUser(final UserModel user) {
    return UsersFormModel(
      fullName: user.name,
      username: user.username,
      role: user.role,
      active: user.isActive,
    );
  }
}
