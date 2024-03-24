import 'package:bloc/bloc.dart';
import 'package:clover_ventures/model/order_book_model.dart';
import 'package:clover_ventures/model/ticker_model.dart';
import 'package:clover_ventures/service/api_service.dart';
import 'package:clover_ventures/views/widgets/search_field.dart';

part 'crypto_event.dart';
part 'crypto_state.dart';

class CryptoBloc extends Bloc<CryptoEvent, CryptoState> {
  CryptoBloc() : super(CryptoInitialState(loading: false)) {
    fetchCrypto();
  }

  void fetchCrypto() {
    on<CryptoEventInitial>((event, emit) async {
      emit(CryptoState(loading: true));
      TickerModel? tickerResult = await ApiService()
          .getTicker("${SearchField.searchController.text}usd");
      OrderBookModel? orderBookResult = await ApiService()
          .getOrderBook("${SearchField.searchController.text}usd");
      emit(
        CryptoState(
          loading: false,
          tickerModel: tickerResult,
          orderBookModel: orderBookResult,
        ),
      );
    });
  }
}
