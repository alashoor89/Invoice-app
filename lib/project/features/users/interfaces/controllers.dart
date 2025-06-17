import 'package:flutter/material.dart';

import '../models/user_model.dart';

abstract class UsersController {
  Future<void> openCreateUserDialog(final BuildContext context);

  Future<void> openEditUserDialog(final BuildContext context, final UserModel user);
}
