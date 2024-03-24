import 'package:flutter/material.dart';

class EmptyDataWidget extends StatelessWidget {
  const EmptyDataWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: size.height * 0.05),
          const Icon(
            Icons.search,
            size: 200,
            color: Colors.grey,
          ),
          SizedBox(height: size.height * 0.03),
          const Text(
            'Enter a currency pair to load data',
            style: TextStyle(fontSize: 17),
          ),
        ],
      ),
    );
  }
}
