// To parse this JSON data, do
//
//     final orderBookModel = orderBookModelFromJson(jsonString);

import 'dart:convert';

OrderBookModel orderBookModelFromJson(String str) =>
    OrderBookModel.fromJson(json.decode(str));

String orderBookModelToJson(OrderBookModel data) => json.encode(data.toJson());

class OrderBookModel {
  String? timestamp;
  String? microtimestamp;
  List<List<String>>? bids;
  List<List<String>>? asks;

  OrderBookModel({
    this.timestamp,
    this.microtimestamp,
    this.bids,
    this.asks,
  });

  factory OrderBookModel.fromJson(Map<String, dynamic> json) => OrderBookModel(
        timestamp: json["timestamp"],
        microtimestamp: json["microtimestamp"],
        bids: json["bids"] == null
            ? []
            : List<List<String>>.from(
                json["bids"]!.map((x) => List<String>.from(x.map((x) => x)))),
        asks: json["asks"] == null
            ? []
            : List<List<String>>.from(
                json["asks"]!.map((x) => List<String>.from(x.map((x) => x)))),
      );

  Map<String, dynamic> toJson() => {
        "timestamp": timestamp,
        "microtimestamp": microtimestamp,
        "bids": bids == null
            ? []
            : List<dynamic>.from(
                bids!.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "asks": asks == null
            ? []
            : List<dynamic>.from(
                asks!.map((x) => List<dynamic>.from(x.map((x) => x)))),
      };
}
