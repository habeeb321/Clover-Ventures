part of 'crypto_bloc.dart';

@immutable
sealed class CryptoState {}

class CryptoStateInitial extends CryptoState {}

class CryptoStateSuccess extends CryptoState {
  final TickerModel? tickerModel;
  final OrderBookModel? orderBookModel;

  CryptoStateSuccess({required this.tickerModel, required this.orderBookModel});
}

class CryptoStateFailure extends CryptoState {
  final String error;

  CryptoStateFailure({required this.error});
}

class CryptoStateLoading extends CryptoState {}
