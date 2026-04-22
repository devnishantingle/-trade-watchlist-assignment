import 'package:flutter/material.dart';

import '../../../core/widgets/main_tab_scaffold.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainTabScaffold(
      currentIndex: 3,
      title: 'Portfolio',
      body: Center(
        child: Text(
          'Portfolio Screen',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
