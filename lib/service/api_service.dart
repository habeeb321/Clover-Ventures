import 'package:clover_ventures/model/order_book_model.dart';
import 'package:clover_ventures/model/ticker_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiService {
  Future<TickerModel?> getTicker(String value) async {
    try {
      Dio dio = Dio();
      Response response =
          await dio.get('https://www.bitstamp.net/api/v2/ticker/$value');
      if (response.statusCode == 200 || response.statusCode == 201) {
        return TickerModel.fromJson(response.data);
      }
    } catch (e) {
      debugPrint('$e');
    }
    return null;
  }

  Future<OrderBookModel?> getOrderBook(String value) async {
    try {
      Dio dio = Dio();
      Response response =
          await dio.get('https://www.bitstamp.net/api/v2/order_book/$value');
      if (response.statusCode == 200 || response.statusCode == 201) {
        return OrderBookModel.fromJson(response.data);
      }
    } catch (e) {
      debugPrint('$e');
    }
    return null;
  }
}
