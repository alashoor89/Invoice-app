import 'package:flutter/material.dart';

import '../../../../common/widgets/content_constraint.dart';

class UsersHeader extends StatelessWidget {
  const UsersHeader({super.key});

  @override
  Widget build(final BuildContext context) {
    return ContentConstraint(
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Users',
              style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 144.0,
            height: 40.0,
            child: ElevatedButton.icon(
              icon: const Icon(Icons.add),
              label: const Text('Create User'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                iconSize: 24,
              ),
              onPressed: () {
                // Show Create User Dialog
              },
            ),
          ),
        ],
      ),
    );
  }
}
