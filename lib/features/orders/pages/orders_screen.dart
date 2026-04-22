import 'package:assgnment/core/widgets/main_tab_scaffold.dart';
import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainTabScaffold(
      currentIndex: 1,
      title: 'Orders',
      body: Center(
        child: Text(
          'Orders Screen',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
