import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/route_names.dart';
import '../../../../core/widgets/app_bottom_nav.dart';

class WatchlistBottomNav extends StatelessWidget {
  const WatchlistBottomNav({super.key});

  static const _paths = [
    RouteNames.watchlistPath,
    RouteNames.ordersPath,
    RouteNames.gttPath,
    RouteNames.portfolioPath,
    RouteNames.fundsPath,
    RouteNames.profilePath,
  ];

  @override
  Widget build(BuildContext context) {
    return AppBottomNav(
      currentIndex: 0,
      onTap: (index) {
        if (index == 0) {
          return;
        }
        context.go(_paths[index]);
      },
    );
  }
}
