import 'package:clover_ventures/crypto/crypto_bloc.dart';
import 'package:clover_ventures/views/widgets/empty_data_widget.dart';
import 'package:clover_ventures/views/widgets/loading_widget.dart';
import 'package:clover_ventures/views/widgets/search_field_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/getwidget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final TextEditingController searchController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchField(searchController: searchController),
                BlocBuilder<CryptoBloc, CryptoState>(
                  builder: (context, state) {
                    if (state is CryptoStateLoading) {
                      return const LoadingWidget();
                    }
                    if (state is CryptoStateFailure) {
                      return Center(
                        child: Text(state.error),
                      );
                    }
                    if (state is CryptoStateSuccess) {
                      return Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: size.height * 0.04),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    searchController.text,
                                    style: const TextStyle(
                                      fontSize: 35,
                                    ),
                                  ),
                                  Text(
                                    state.tickerModel?.timestamp ?? '',
                                    style: const TextStyle(fontSize: 13),
                                  ),
                                ],
                              ),
                              SizedBox(height: size.height * 0.02),
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'OPEN',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            '\$ ${state.tickerModel?.open ?? ''}',
                                            style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: size.height * 0.04),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'LOW',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            '\$ ${state.tickerModel?.low ?? ''}',
                                            style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Column(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'HIGH',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            '\$ ${state.tickerModel?.high ?? ''}',
                                            style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: size.height * 0.04),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'LAST',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            '\$ ${state.tickerModel?.last ?? ''}',
                                            style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: size.width * 0.1),
                                ],
                              ),
                              SizedBox(height: size.height * 0.06),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'VOLUME',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    state.tickerModel?.volume ?? '',
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          GFAccordion(
                            collapsedIcon: const GFButton(
                              onPressed: null,
                              text: 'VIEW ORDER BOOK',
                              icon: Icon(Icons.arrow_drop_down_outlined),
                            ),
                            expandedIcon: const GFButton(
                              onPressed: null,
                              text: 'HIDE ORDER BOOK',
                              icon: Icon(Icons.arrow_drop_up_outlined),
                            ),
                            contentChild: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'ORDER BOOK',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          height: size.height * 0.25,
                                          width: size.width * 0.15,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Center(
                                                child: Text(
                                                  'BID PRICE',
                                                  style: TextStyle(
                                                    fontSize: 11,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              Expanded(
                                                child: ListView.separated(
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Center(
                                                      child: Text(
                                                        state
                                                                .orderBookModel
                                                                ?.bids?[index]
                                                                .first
                                                                .toString() ??
                                                            '',
                                                        style: const TextStyle(
                                                            fontSize: 11),
                                                      ),
                                                    );
                                                  },
                                                  separatorBuilder:
                                                      (context, index) =>
                                                          const SizedBox(
                                                              height: 10),
                                                  itemCount: state
                                                          .orderBookModel
                                                          ?.bids
                                                          ?.length ??
                                                      0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: size.height * 0.25,
                                          width: 85,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Center(
                                                child: Text(
                                                  'QTY',
                                                  style: TextStyle(
                                                    fontSize: 11,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              Expanded(
                                                child: ListView.separated(
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Center(
                                                      child: Text(
                                                        state
                                                                .orderBookModel
                                                                ?.bids?[index]
                                                                .last
                                                                .toString() ??
                                                            '',
                                                        style: const TextStyle(
                                                            fontSize: 11),
                                                      ),
                                                    );
                                                  },
                                                  separatorBuilder:
                                                      (context, index) =>
                                                          const SizedBox(
                                                              height: 10),
                                                  itemCount: 20,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: size.height * 0.25,
                                          width: 85,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Center(
                                                child: Text(
                                                  'QTY',
                                                  style: TextStyle(
                                                    fontSize: 11,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              Expanded(
                                                child: ListView.separated(
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Center(
                                                      child: Text(
                                                        state
                                                                .orderBookModel
                                                                ?.asks?[index]
                                                                .last
                                                                .toString() ??
                                                            '',
                                                        style: const TextStyle(
                                                            fontSize: 11),
                                                      ),
                                                    );
                                                  },
                                                  separatorBuilder:
                                                      (context, index) =>
                                                          const SizedBox(
                                                              height: 10),
                                                  itemCount: 20,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: size.height * 0.25,
                                          width: 85,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Center(
                                                child: Text(
                                                  'ASK PRICE',
                                                  style: TextStyle(
                                                    fontSize: 11,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              Expanded(
                                                child: ListView.separated(
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Center(
                                                      child: Text(
                                                        state
                                                                .orderBookModel
                                                                ?.asks?[index]
                                                                .first
                                                                .toString() ??
                                                            '',
                                                        style: const TextStyle(
                                                            fontSize: 11),
                                                      ),
                                                    );
                                                  },
                                                  separatorBuilder:
                                                      (context, index) =>
                                                          const SizedBox(
                                                              height: 10),
                                                  itemCount: 20,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    } else {
                      return EmptyDataWidget(size: size);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: BlocBuilder<CryptoBloc, CryptoState>(
        builder: (context, state) {
          if (state is CryptoStateSuccess) {
            return state.tickerModel != null
                ? FloatingActionButton(
                    onPressed: () => context.read<CryptoBloc>().add(
                        CryptoEventRequested(
                            searchText: searchController.text)),
                    backgroundColor: const Color(0xff6E00F8),
                    shape: const CircleBorder(),
                    child: const Icon(
                      Icons.sync,
                      color: Colors.white,
                    ),
                  )
                : const SizedBox();
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
