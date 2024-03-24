import 'package:clover_ventures/logic/crypto/crypto_bloc.dart';
import 'package:clover_ventures/views/widgets/empty_data_widget.dart';
import 'package:clover_ventures/views/widgets/loading_widget.dart';
import 'package:clover_ventures/views/widgets/order_book_widget.dart';
import 'package:clover_ventures/views/widgets/search_field.dart';
import 'package:clover_ventures/views/widgets/ticker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: BlocBuilder<CryptoBloc, CryptoState>(
              builder: (context, state) {
                return state.loading == true
                    ? const LoadingWidget()
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SearchField(state: state),
                          state.tickerModel == null
                              ? EmptyDataWidget(size: size)
                              : Column(
                                  children: [
                                    TickerWidget(size: size, state: state),
                                    OrderBookWidget(size: size, state: state),
                                  ],
                                ),
                        ],
                      );
              },
            ),
          ),
        ),
      ),
      floatingActionButton: BlocBuilder<CryptoBloc, CryptoState>(
        builder: (context, state) {
          return state.tickerModel != null
              ? FloatingActionButton(
                  onPressed: () =>
                      context.read<CryptoBloc>().add(CryptoEventInitial()),
                  backgroundColor: const Color(0xff6E00F8),
                  shape: const CircleBorder(),
                  child: const Icon(
                    Icons.sync,
                    color: Colors.white,
                  ),
                )
              : const SizedBox();
        },
      ),
    );
  }
}
