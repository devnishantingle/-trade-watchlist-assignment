import 'package:flutter/material.dart';

import '../../../core/widgets/main_tab_scaffold.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainTabScaffold(
      currentIndex: 5,
      title: 'Profile',
      body: Center(
        child: Text(
          'Profile Screen',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
