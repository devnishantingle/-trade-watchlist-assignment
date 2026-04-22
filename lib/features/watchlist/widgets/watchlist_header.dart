import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:assgnment/app/router/route_names.dart';
import 'package:assgnment/app/theme/app_colors.dart';

class WatchlistHeader extends StatelessWidget {
  const WatchlistHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 8, 4),
      child: Row(
        children: [
          const Expanded(
            child: Text(
              'Watchlist',
              style: TextStyle(
                color: AppColors.text,
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          IconButton(
            tooltip: 'Edit watchlist',
            onPressed: () => context.pushNamed(RouteNames.editWatchlist),
            icon: const Icon(Icons.edit_outlined),
          ),
        ],
      ),
    );
  }
}
