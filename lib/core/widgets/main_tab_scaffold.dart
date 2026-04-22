import 'package:flutter/material.dart';

import 'package:assgnment/core/widgets/app_bottom_nav.dart';

class MainTabScaffold extends StatelessWidget {
  const MainTabScaffold({
    required this.currentIndex,
    required this.title,
    required this.body,
    this.useSafeArea = true,
    super.key,
  });

  final int currentIndex;
  final String title;
  final Widget body;
  final bool useSafeArea;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text(title)),
      bottomNavigationBar: AppBottomNav(currentIndex: currentIndex),
      body: useSafeArea ? SafeArea(child: body) : body,
    );
  }
}
