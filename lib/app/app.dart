import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/watchlist/bloc/watchlist_bloc.dart';
import '../features/watchlist/bloc/watchlist_event.dart';
import '../features/watchlist/repository/watchlist_repository.dart';
import 'router/app_router.dart';
import 'theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => const WatchlistRepository(),
      child: BlocProvider(
        create: (context) =>
            WatchlistBloc(repository: context.read<WatchlistRepository>())
              ..add(const LoadWatchlist()),
        child: MaterialApp.router(
          title: 'Market Watchlist',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          routerConfig: router,
        ),
      ),
    );
  }
}
