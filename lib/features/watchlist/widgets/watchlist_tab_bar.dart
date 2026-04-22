import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';

class WatchlistTabBar extends StatelessWidget {
  const WatchlistTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        _WatchlistTab(label: 'Watchlist 1', isActive: true),
        _WatchlistTab(label: 'Watchlist 5'),
        _WatchlistTab(label: 'Watchlist 6'),
      ],
    );
  }
}

class _WatchlistTab extends StatelessWidget {
  const _WatchlistTab({required this.label, this.isActive = false});

  final String label;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text(
              label,
              style: TextStyle(
                color: isActive ? AppColors.text : AppColors.mutedText,
                fontSize: 13,
                fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
              ),
            ),
          ),
          Container(
            height: 2,
            color: isActive ? AppColors.text : AppColors.border,
          ),
        ],
      ),
    );
  }
}
