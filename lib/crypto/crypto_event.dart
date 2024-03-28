part of 'crypto_bloc.dart';

@immutable
sealed class CryptoEvent {}

class CryptoEventInitial extends CryptoEvent {}

class CryptoEventRequested extends CryptoEvent {
  final String searchText;

  CryptoEventRequested({required this.searchText});
}
