import 'package:clover_ventures/model/order_book_model.dart';
import 'package:clover_ventures/model/ticker_model.dart';
import 'package:clover_ventures/service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'crypto_event.dart';
part 'crypto_state.dart';

class CryptoBloc extends Bloc<CryptoEvent, CryptoState> {
  CryptoBloc() : super(CryptoStateInitial()) {
    on<CryptoEventRequested>(_fetchCrypto);
  }

  void _fetchCrypto(CryptoEventRequested event, Emitter<CryptoState> emit) async {
    emit(CryptoStateLoading());
    try {
      TickerModel? tickerResult = await ApiService().getTicker("${event.searchText}usd");
      OrderBookModel? orderBookResult = await ApiService().getOrderBook("${event.searchText}usd");
      emit(CryptoStateSuccess(tickerModel: tickerResult, orderBookModel: orderBookResult));
    } catch (e) {
      CryptoStateFailure(error: e.toString());
    }
  }
}
