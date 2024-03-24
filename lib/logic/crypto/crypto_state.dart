part of 'crypto_bloc.dart';

class CryptoState {
  bool? loading = false;
  bool? isOrderVisible = false;
  TickerModel? tickerModel;
  OrderBookModel? orderBookModel;

  CryptoState({
    this.loading,
    this.isOrderVisible,
    this.tickerModel,
    this.orderBookModel,
  });
}

class CryptoInitialState extends CryptoState {
  CryptoInitialState({required super.loading});
}

class OrderBookState extends CryptoState {
  OrderBookState({required super.isOrderVisible});
}
