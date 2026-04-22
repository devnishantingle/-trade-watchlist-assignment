import 'package:assgnment/core/widgets/main_tab_scaffold.dart';
import 'package:flutter/material.dart';

class GttScreen extends StatelessWidget {
  const GttScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainTabScaffold(
      currentIndex: 2,
      title: 'GTT+',
      body: Center(
        child: Text(
          'GTT+ Screen',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
