import 'package:equatable/equatable.dart';

sealed class WatchlistEvent extends Equatable {
  const WatchlistEvent();

  @override
  List<Object?> get props => [];
}

class LoadWatchlist extends WatchlistEvent {
  const LoadWatchlist();
}

class SearchStocks extends WatchlistEvent {
  const SearchStocks(this.query);

  final String query;

  @override
  List<Object?> get props => [query];
}

class ReorderStocks extends WatchlistEvent {
  const ReorderStocks({required this.oldIndex, required this.newIndex});

  final int oldIndex;
  final int newIndex;

  @override
  List<Object?> get props => [oldIndex, newIndex];
}

class DeleteStock extends WatchlistEvent {
  const DeleteStock(this.index);

  final int index;

  @override
  List<Object?> get props => [index];
}

class SaveWatchlist extends WatchlistEvent {
  const SaveWatchlist();
}
