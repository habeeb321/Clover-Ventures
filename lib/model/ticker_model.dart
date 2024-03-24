// To parse this JSON data, do
//
//     final tickerModel = tickerModelFromJson(jsonString);

import 'dart:convert';

TickerModel tickerModelFromJson(String str) =>
    TickerModel.fromJson(json.decode(str));

String tickerModelToJson(TickerModel data) => json.encode(data.toJson());

class TickerModel {
  String? timestamp;
  String? open;
  String? high;
  String? low;
  String? last;
  String? volume;
  String? vwap;
  String? bid;
  String? ask;
  String? side;
  String? open24;
  String? percentChange24;

  TickerModel({
    this.timestamp,
    this.open,
    this.high,
    this.low,
    this.last,
    this.volume,
    this.vwap,
    this.bid,
    this.ask,
    this.side,
    this.open24,
    this.percentChange24,
  });

  factory TickerModel.fromJson(Map<String, dynamic> json) => TickerModel(
        timestamp: json["timestamp"],
        open: json["open"],
        high: json["high"],
        low: json["low"],
        last: json["last"],
        volume: json["volume"],
        vwap: json["vwap"],
        bid: json["bid"],
        ask: json["ask"],
        side: json["side"],
        open24: json["open_24"],
        percentChange24: json["percent_change_24"],
      );

  Map<String, dynamic> toJson() => {
        "timestamp": timestamp,
        "open": open,
        "high": high,
        "low": low,
        "last": last,
        "volume": volume,
        "vwap": vwap,
        "bid": bid,
        "ask": ask,
        "side": side,
        "open_24": open24,
        "percent_change_24": percentChange24,
      };
}
