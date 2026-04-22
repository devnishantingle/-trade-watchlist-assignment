import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:assgnment/app/theme/app_colors.dart';

class AppBottomNav extends StatelessWidget {
  const AppBottomNav({required this.currentIndex, this.onTap, super.key});

  final int currentIndex;
  final ValueChanged<int>? onTap;

  void _handleTap(BuildContext context, int index) {
    if (index == currentIndex) {
      return;
    }

    if (onTap != null) {
      onTap!(index);
      return;
    }

    switch (index) {
      case 0:
        context.go('/');
      case 1:
        context.go('/orders');
      case 2:
        context.go('/gtt');
      case 3:
        context.go('/portfolio');
      case 4:
        context.go('/funds');
      case 5:
        context.go('/profile');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.text,
      unselectedItemColor: AppColors.mutedText,
      selectedFontSize: 11,
      unselectedFontSize: 11,
      showUnselectedLabels: true,
      backgroundColor: AppColors.surface,
      elevation: 8,
      onTap: (index) => _handleTap(context, index),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.bookmark_border),
          activeIcon: Icon(Icons.bookmark),
          label: 'Watchlist',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.receipt_long_outlined),
          label: 'Orders',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.alarm_add_outlined),
          label: 'GTT',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.pie_chart_outline),
          label: 'Portfolio',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_balance_wallet_outlined),
          label: 'Funds',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Profile',
        ),
      ],
    );
  }
}
