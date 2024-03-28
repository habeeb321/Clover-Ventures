// import 'package:clover_ventures/crypto/crypto_bloc.dart';
// import 'package:expandable/expandable.dart';
// import 'package:flutter/material.dart';

// class OrderBookWidget extends StatelessWidget {
//   const OrderBookWidget({super.key, required this.size, required this.state});

//   final Size size;
//   final CryptoState state;
//   static final ExpandableController expandableController =
//       ExpandableController();

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () => expandableController.toggle(),
//       child: ExpandablePanel(
//         controller: expandableController,
//         header: Builder(builder: (context) {
//           return Padding(
//             padding: EdgeInsets.only(
//               left: size.width * 0.4,
//             ),
//             child: TextButton(
//               onPressed: () {},
//               child: Text(
//                 expandableController.expanded
//                     ? 'HIDE ORDER BOOK'
//                     : 'VIEW ORDER BOOK',
//                 style: const TextStyle(
//                   color: Color(0xff6E00F8),
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//             ),
//           );
//         }),
//         collapsed: const Align(
//           alignment: Alignment.topRight,
//         ),
//         expanded: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'ORDER BOOK',
//               style: TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//             Card(
//               child: Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     SizedBox(
//                       height: size.height * 0.25,
//                       width: 85,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Center(
//                             child: Text(
//                               'BID PRICE',
//                               style: TextStyle(
//                                 fontSize: 11,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                           ),
//                           const SizedBox(height: 10),
//                           Expanded(
//                             child: ListView.separated(
//                               itemBuilder: (context, index) {
//                                 return Center(
//                                   child: Text(
//                                     state.orderBookModel?.bids?[index].first
//                                             .toString() ??
//                                         '',
//                                     style: const TextStyle(fontSize: 11),
//                                   ),
//                                 );
//                               },
//                               separatorBuilder: (context, index) =>
//                                   const SizedBox(height: 10),
//                               itemCount:
//                                   state.orderBookModel?.bids?.length ?? 0,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: size.height * 0.25,
//                       width: 85,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Center(
//                             child: Text(
//                               'QTY',
//                               style: TextStyle(
//                                 fontSize: 11,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                           ),
//                           const SizedBox(height: 10),
//                           Expanded(
//                             child: ListView.separated(
//                               itemBuilder: (context, index) {
//                                 return Center(
//                                   child: Text(
//                                     state.orderBookModel?.bids?[index].last
//                                             .toString() ??
//                                         '',
//                                     style: const TextStyle(fontSize: 11),
//                                   ),
//                                 );
//                               },
//                               separatorBuilder: (context, index) =>
//                                   const SizedBox(height: 10),
//                               itemCount: 20,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: size.height * 0.25,
//                       width: 85,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Center(
//                             child: Text(
//                               'QTY',
//                               style: TextStyle(
//                                 fontSize: 11,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                           ),
//                           const SizedBox(height: 10),
//                           Expanded(
//                             child: ListView.separated(
//                               itemBuilder: (context, index) {
//                                 return Center(
//                                   child: Text(
//                                     state.orderBookModel?.asks?[index].last
//                                             .toString() ??
//                                         '',
//                                     style: const TextStyle(fontSize: 11),
//                                   ),
//                                 );
//                               },
//                               separatorBuilder: (context, index) =>
//                                   const SizedBox(height: 10),
//                               itemCount: 20,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: size.height * 0.25,
//                       width: 85,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Center(
//                             child: Text(
//                               'ASK PRICE',
//                               style: TextStyle(
//                                 fontSize: 11,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                           ),
//                           const SizedBox(height: 10),
//                           Expanded(
//                             child: ListView.separated(
//                               itemBuilder: (context, index) {
//                                 return Center(
//                                   child: Text(
//                                     state.orderBookModel?.asks?[index].first
//                                             .toString() ??
//                                         '',
//                                     style: const TextStyle(fontSize: 11),
//                                   ),
//                                 );
//                               },
//                               separatorBuilder: (context, index) =>
//                                   const SizedBox(height: 10),
//                               itemCount: 20,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
