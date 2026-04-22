import 'package:flutter_bloc/flutter_bloc.dart';

import '../repository/watchlist_repository.dart';
import 'watchlist_event.dart';
import 'watchlist_state.dart';

class WatchlistBloc extends Bloc<WatchlistEvent, WatchlistState> {
  WatchlistBloc({required WatchlistRepository repository})
    : _repository = repository,
      super(const WatchlistState.initial()) {
    on<LoadWatchlist>(_onLoadWatchlist);
    on<SearchStocks>(_onSearchStocks);
    on<ReorderStocks>(_onReorderStocks);
    on<DeleteStock>(_onDeleteStock);
    on<SaveWatchlist>(_onSaveWatchlist);
  }

  final WatchlistRepository _repository;

  Future<void> _onLoadWatchlist(
    LoadWatchlist event,
    Emitter<WatchlistState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, isSaved: false));
    final stocks = await _repository.getWatchlist();
    emit(
      state.copyWith(
        allStocks: stocks,
        stocks: stocks,
        isLoading: false,
        isSaved: false,
      ),
    );
  }

  void _onSearchStocks(SearchStocks event, Emitter<WatchlistState> emit) {
    final query = event.query.trim().toLowerCase();

    if (query.isEmpty) {
      emit(state.copyWith(stocks: state.allStocks));
      return;
    }

    final filteredStocks = state.allStocks
        .where((stock) => stock.symbol.toLowerCase().contains(query))
        .toList(growable: false);

    emit(state.copyWith(stocks: filteredStocks));
  }

  void _onReorderStocks(ReorderStocks event, Emitter<WatchlistState> emit) {
    if (event.oldIndex < 0 ||
        event.oldIndex >= state.stocks.length ||
        event.newIndex < 0 ||
        event.newIndex > state.stocks.length) {
      return;
    }

    final stocks = List.of(state.stocks);
    var newIndex = event.newIndex;
    if (newIndex > event.oldIndex) {
      newIndex -= 1;
    }

    final stock = stocks.removeAt(event.oldIndex);
    stocks.insert(newIndex, stock);
    final allStocks = state.stocks.length == state.allStocks.length
        ? stocks
        : state.allStocks;
    emit(state.copyWith(allStocks: allStocks, stocks: stocks, isSaved: false));
  }

  void _onDeleteStock(DeleteStock event, Emitter<WatchlistState> emit) {
    if (event.index < 0 || event.index >= state.stocks.length) {
      return;
    }

    final removedStock = state.stocks[event.index];
    final stocks = List.of(state.stocks)..removeAt(event.index);
    final allStocks = state.allStocks
        .where((stock) => stock.symbol != removedStock.symbol)
        .toList(growable: false);
    emit(state.copyWith(allStocks: allStocks, stocks: stocks, isSaved: false));
  }

  void _onSaveWatchlist(SaveWatchlist event, Emitter<WatchlistState> emit) {
    emit(state.copyWith(isSaved: true));
  }
}
