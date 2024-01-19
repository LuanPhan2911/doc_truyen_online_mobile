// import 'package:dio/dio.dart';
// import 'package:doc_truyen_online_mobile/components/layouts/no_data_from_server.dart';
// import 'package:doc_truyen_online_mobile/data/utils/paginator_cursor.dart';
// import 'package:doc_truyen_online_mobile/styles/app_color.dart';
// import 'package:flutter/material.dart';

// // ignore: must_be_immutable
// class PaginateCursor extends StatefulWidget {
//   final Future<Response> Function(String? cursor) fetch;
//   final Widget Function(Map) builder;
//   Map? newItem;

//   String? cursor;
//   PaginateCursor({
//     super.key,
//     required this.fetch,
//     required this.builder,
//     this.newItem,
//   });

//   @override
//   State<PaginateCursor> createState() => _PaginatorState();
// }

// class _PaginatorState extends State<PaginateCursor> {
//   late Future<PaginatorCursor> paginate;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     paginate = fetchData(null);
//   }

//   Future<PaginatorCursor> fetchData(String? cursor) async {
//     Response res = await widget.fetch(cursor);
//     return PaginatorCursor.fromJson(res.data['data']);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: paginate,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         } else if (snapshot.hasData) {
//           String? nextCursor = snapshot.data?.nextCursor;
//           String? prevCursor = snapshot.data?.prevCursor;
//           List data = snapshot.data!.data;
//           if (widget.newItem != null) {
//             data.insert(0, widget.newItem!);
//             widget.newItem = null;
//           }
//           return ListView(
//             children: [
//               ...data.map((e) => widget.builder(e)).toList(),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   IconButton(
//                     style: AppColor.iconBtnBlue,
//                     onPressed: prevCursor != null
//                         ? () {
//                             setState(() {
//                               paginate = fetchData(prevCursor);
//                             });
//                           }
//                         : null,
//                     icon: const Icon(Icons.navigate_before),
//                   ),
//                   IconButton(
//                     style: AppColor.iconBtnBlue,
//                     onPressed: nextCursor != null
//                         ? () {
//                             setState(() {
//                               paginate = fetchData(nextCursor);
//                             });
//                           }
//                         : null,
//                     icon: const Icon(Icons.navigate_next),
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 50,
//               )
//             ],
//           );
//         }
//         return Center(
//           child: NoDataFromServer(
//             onRefresh: () {
//               setState(() {
//                 paginate = fetchData(null);
//               });
//             },
//           ),
//         );
//       },
//     );
//   }
// }
