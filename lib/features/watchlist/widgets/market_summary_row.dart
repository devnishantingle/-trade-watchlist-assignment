import 'package:flutter/material.dart';

import 'package:assgnment/app/theme/app_colors.dart';

class MarketSummaryRow extends StatelessWidget {
  const MarketSummaryRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 6, 8, 8),
      child: Row(
        children: [
          const Expanded(
            child: _MarketSummaryItem(
              title: 'SENSEX',
              value: '73,142.80',
              change: '-0.21%',
              isPositive: false,
            ),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: _MarketSummaryItem(
              title: 'NIFTY BANK',
              value: '47,124.60',
              change: '+0.18%',
              isPositive: true,
            ),
          ),
          IconButton(
            tooltip: 'View market indices',
            onPressed: () {},
            icon: const Icon(Icons.chevron_right),
          ),
        ],
      ),
    );
  }
}

class _MarketSummaryItem extends StatelessWidget {
  const _MarketSummaryItem({
    required this.title,
    required this.value,
    required this.change,
    required this.isPositive,
  });

  final String title;
  final String value;
  final String change;
  final bool isPositive;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 9),
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: AppColors.mutedText,
              fontSize: 10,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 5),
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Text(
                  value,
                  style: const TextStyle(
                    color: AppColors.text,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  change,
                  style: TextStyle(
                    color: isPositive ? AppColors.positive : AppColors.negative,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
