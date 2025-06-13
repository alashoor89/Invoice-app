import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../enums/user_role.dart';
import '../interfaces/controllers.dart';
import '../models/user_model.dart';

part 'users_controller.g.dart';

// temporary jut for listing users in tables
final usersProvider = StateProvider<List<UserModel>>((final ref) {
  return const [
    UserModel(
      name: 'John Doe',
      username: 'johndoe',
      role: UserRole.admin,
      isActive: true,
    ),
    UserModel(
      name: 'Jane Smith',
      username: 'janesmith',
      role: UserRole.salesman,
      isActive: false,
    ),
    UserModel(
      name: 'Alice Johnson',
      username: 'alicejohnson',
      role: UserRole.salesman,
      isActive: true,
    ),
    UserModel(
      name: 'Bob Brown',
      username: 'bobbrown',
      role: UserRole.admin,
      isActive: true,
    ),
    UserModel(
      name: 'Charlie White',
      username: 'charliewhite',
      role: UserRole.salesman,
      isActive: false,
    ),
    UserModel(
      name: 'Diana Green',
      username: 'dianagreen',
      role: UserRole.admin,
      isActive: true,
    ),
    UserModel(
      name: 'Ethan Blue',
      username: 'ethanblue',
      role: UserRole.salesman,
      isActive: true,
    ),
    UserModel(
      name: 'Fiona Black',
      username: 'fionablack',
      role: UserRole.admin,
      isActive: false,
    ),
    UserModel(
      name: 'George Yellow',
      username: 'georgeyellow',
      role: UserRole.salesman,
      isActive: true,
    ),
    UserModel(
      name: 'Hannah Purple',
      username: 'hannahpurple',
      role: UserRole.admin,
      isActive: true,
    ),
    UserModel(
      name: 'Ian Orange',
      username: 'ianorange',
      role: UserRole.salesman,
      isActive: false,
    ),
    UserModel(
      name: 'Jack Gray',
      username: 'jackgray',
      role: UserRole.admin,
      isActive: true,
    ),
    UserModel(
      name: 'Kathy Pink',
      username: 'kathypink',
      role: UserRole.salesman,
      isActive: true,
    ),

    UserModel(
      name: 'Liam Cyan',
      username: 'liamcyan',
      role: UserRole.admin,
      isActive: false,
    ),

    UserModel(
      name: 'Mia Magenta',
      username: 'miamagenta',
      role: UserRole.salesman,
      isActive: true,
    ),
    UserModel(
      name: 'Noah Teal',
      username: 'noahteal',
      role: UserRole.admin,
      isActive: true,
    ),
  ];
});

@Riverpod(keepAlive: true)
UsersController usersController(final Ref ref) {
  return _UsersController(ref);
}

class _UsersController extends UsersController {
  final Ref _ref;

  _UsersController(this._ref);
}
