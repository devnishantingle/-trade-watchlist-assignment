import 'package:go_router/go_router.dart';

import '../../features/funds/screens/funds_screen.dart';
import '../../features/gtt/screens/gtt_screen.dart';
import '../../features/orders/screens/orders_screen.dart';
import '../../features/portfolio/screens/portfolio_screen.dart';
import '../../features/profile/screens/profile_screen.dart';
import '../../features/watchlist/screens/edit_watchlist_screen.dart';
import '../../features/watchlist/screens/watchlist_screen.dart';
import 'route_names.dart';

GoRouter router = GoRouter(
  initialLocation: RouteNames.watchlistPath,
  routes: [
    GoRoute(
      path: RouteNames.watchlistPath,
      name: RouteNames.watchlist,
      builder: (context, state) => const WatchlistScreen(),
    ),
    GoRoute(
      path: RouteNames.ordersPath,
      name: RouteNames.orders,
      builder: (context, state) => const OrdersScreen(),
    ),
    GoRoute(
      path: RouteNames.gttPath,
      name: RouteNames.gtt,
      builder: (context, state) => const GttScreen(),
    ),
    GoRoute(
      path: RouteNames.portfolioPath,
      name: RouteNames.portfolio,
      builder: (context, state) => const PortfolioScreen(),
    ),
    GoRoute(
      path: RouteNames.fundsPath,
      name: RouteNames.funds,
      builder: (context, state) => const FundsScreen(),
    ),
    GoRoute(
      path: RouteNames.profilePath,
      name: RouteNames.profile,
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: RouteNames.editWatchlistPath,
      name: RouteNames.editWatchlist,
      builder: (context, state) => const EditWatchlistScreen(),
    ),
  ],
);
