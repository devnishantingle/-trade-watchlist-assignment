import 'package:assgnment/core/widgets/main_tab_scaffold.dart';
import 'package:flutter/material.dart';

class FundsScreen extends StatelessWidget {
  const FundsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainTabScaffold(
      currentIndex: 4,
      title: 'Funds',
      body: Center(
        child: Text(
          'Funds Screen',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
