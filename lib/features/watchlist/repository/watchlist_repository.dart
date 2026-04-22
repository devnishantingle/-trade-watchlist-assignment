import 'package:assgnment/features/watchlist/data/watchlist_dummy_data.dart';
import 'package:assgnment/features/watchlist/models/stock_model.dart';

class WatchlistRepository {
  const WatchlistRepository();

  Future<List<StockModel>> getWatchlist() async {
    await Future<void>.delayed(const Duration(milliseconds: 250));
    return List<StockModel>.of(watchlistDummyData);
  }
}
