import 'package:assgnment/features/watchlist/models/stock_model.dart';
import 'package:equatable/equatable.dart';

class WatchlistState extends Equatable {
  const WatchlistState({
    required this.allStocks,
    required this.stocks,
    required this.isLoading,
    required this.isSaved,
  });

  const WatchlistState.initial()
    : allStocks = const [],
      stocks = const [],
      isLoading = false,
      isSaved = false;

  final List<StockModel> allStocks;
  final List<StockModel> stocks;
  final bool isLoading;
  final bool isSaved;

  WatchlistState copyWith({
    List<StockModel>? allStocks,
    List<StockModel>? stocks,
    bool? isLoading,
    bool? isSaved,
  }) {
    return WatchlistState(
      allStocks: allStocks ?? this.allStocks,
      stocks: stocks ?? this.stocks,
      isLoading: isLoading ?? this.isLoading,
      isSaved: isSaved ?? this.isSaved,
    );
  }

  @override
  List<Object?> get props => [allStocks, stocks, isLoading, isSaved];
}
