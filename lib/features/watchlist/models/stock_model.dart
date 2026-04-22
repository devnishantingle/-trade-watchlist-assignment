import 'package:equatable/equatable.dart';

class StockModel extends Equatable {
  const StockModel({
    required this.symbol,
    required this.exchange,
    required this.price,
    required this.change,
    required this.changePercent,
  });

  final String symbol;
  final String exchange;
  final double price;
  final double change;
  final double changePercent;

  bool get isPositive => change >= 0;

  @override
  List<Object?> get props => [symbol, exchange, price, change, changePercent];
}
