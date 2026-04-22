import 'package:flutter/material.dart';

import 'package:assgnment/app/theme/app_colors.dart';
import 'package:assgnment/features/watchlist/models/stock_model.dart';

class EditableStockTile extends StatelessWidget {
  const EditableStockTile({
    required this.stock,
    required this.index,
    required this.onDelete,
    super.key,
  });

  final StockModel stock;
  final int index;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Material(
      key: ValueKey(stock.symbol),
      color: AppColors.surface,
      child: Container(
        height: 54,
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: AppColors.border, width: 0.7),
          ),
        ),
        child: Row(
          children: [
            ReorderableDragStartListener(
              index: index,
              child: const SizedBox(
                width: 48,
                child: Icon(
                  Icons.drag_indicator,
                  color: AppColors.mutedText,
                  size: 22,
                ),
              ),
            ),
            Expanded(
              child: Text(
                stock.symbol,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: AppColors.text,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            IconButton(
              tooltip: 'Delete ${stock.symbol}',
              onPressed: onDelete,
              icon: const Icon(Icons.delete_outline),
              color: AppColors.negative,
            ),
            const SizedBox(width: 6),
          ],
        ),
      ),
    );
  }
}
