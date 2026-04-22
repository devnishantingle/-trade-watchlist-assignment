import 'package:go_router/go_router.dart';

import 'package:assgnment/features/funds/screens/funds_screen.dart';
import 'package:assgnment/features/gtt/screens/gtt_screen.dart';
import 'package:assgnment/features/orders/screens/orders_screen.dart';
import 'package:assgnment/features/portfolio/screens/portfolio_screen.dart';
import 'package:assgnment/features/profile/screens/profile_screen.dart';
import 'package:assgnment/features/watchlist/screens/edit_watchlist_screen.dart';
import 'package:assgnment/features/watchlist/screens/watchlist_screen.dart';
import 'package:assgnment/app/router/route_names.dart';

GoRouter router = GoRouter(
  initialLocation: RouteNames.watchlistPath,
  routes: [
    GoRoute(
      path: RouteNames.watchlistPath,
      name: RouteNames.watchlist,
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: WatchlistScreen()),
    ),
    GoRoute(
      path: RouteNames.ordersPath,
      name: RouteNames.orders,
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: OrdersScreen()),
    ),
    GoRoute(
      path: RouteNames.gttPath,
      name: RouteNames.gtt,
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: GttScreen()),
    ),
    GoRoute(
      path: RouteNames.portfolioPath,
      name: RouteNames.portfolio,
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: PortfolioScreen()),
    ),
    GoRoute(
      path: RouteNames.fundsPath,
      name: RouteNames.funds,
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: FundsScreen()),
    ),
    GoRoute(
      path: RouteNames.profilePath,
      name: RouteNames.profile,
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: ProfileScreen()),
    ),
    GoRoute(
      path: RouteNames.editWatchlistPath,
      name: RouteNames.editWatchlist,
      builder: (context, state) => const EditWatchlistScreen(),
    ),
  ],
);
