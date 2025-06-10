import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(final BuildContext context) {
    return const Scaffold(
      body: Placeholder(
        child: Center(
          child: Text('Home sweet home'),
        ),
      ),
    );
  }
}
