import 'package:clover_ventures/crypto/crypto_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    required this.searchController,
  });

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: CupertinoSearchTextField(
        borderRadius: BorderRadius.zero,
        prefixIcon: const SizedBox(width: 0, height: 0),
        suffixMode: OverlayVisibilityMode.always,
        suffixInsets: const EdgeInsets.only(right: 10),
        suffixIcon: const Icon(
          CupertinoIcons.search,
          color: Colors.black,
        ),
        controller: searchController,
        onSuffixTap: () {
          context.read<CryptoBloc>().add(
              CryptoEventRequested(searchText: searchController.text.trim()));
          debugPrint('clicked ${searchController.text}');
        },
      ),
    );
  }
}
