import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/widgets/app_loader.dart';
import '../../../core/widgets/app_search_bar.dart';
import '../bloc/watchlist_bloc.dart';
import '../bloc/watchlist_event.dart';
import '../bloc/watchlist_state.dart';
import '../widgets/market_summary_row.dart';
import '../widgets/sort_button.dart';
import '../widgets/stock_tile.dart';
import '../widgets/watchlist_bottom_nav.dart';
import '../widgets/watchlist_header.dart';
import '../widgets/watchlist_tab_bar.dart';

class WatchlistScreen extends StatelessWidget {
  const WatchlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const WatchlistBottomNav(),
      body: SafeArea(
        child: BlocBuilder<WatchlistBloc, WatchlistState>(
          builder: (context, state) {
            if (state.isLoading && state.stocks.isEmpty) {
              return const AppLoader();
            }

            return Column(
              children: [
                const WatchlistHeader(),
                const MarketSummaryRow(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 4, 16, 0),
                  child: AppSearchBar(
                    hintText: 'Search for instruments',
                    onChanged: (value) {
                      context.read<WatchlistBloc>().add(SearchStocks(value));
                    },
                  ),
                ),
                const WatchlistTabBar(),
                const SortButton(),
                Expanded(
                  child: state.stocks.isEmpty
                      ? const Center(
                          child: Text(
                            'No results found',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      : ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: state.stocks.length,
                          itemBuilder: (context, index) {
                            return StockTile(stock: state.stocks[index]);
                          },
                        ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
