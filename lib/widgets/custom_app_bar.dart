// import 'package:flutter/material.dart';
//
// class CustomAppBar extends StatefulWidget {
//   @override
//   _CustomAppBarState createState() => _CustomAppBarState();
// }
//
// class _CustomAppBarState extends State<CustomAppBar> {
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(leading: _appBar());
//   }
//
//   Widget _appBar() {
//     return Container(
//       //padding: AppTheme.padding,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: <Widget>[
//           RotatedBox(
//             quarterTurns: 4,
//             child: Icon(Icons.menu, color: Colors.white),
//           ),
//           ClipRRect(
//             borderRadius: BorderRadius.all(Radius.circular(13)),
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Theme.of(context).backgroundColor,
//                 boxShadow: <BoxShadow>[
//                   BoxShadow(
//                       color: Color(0xfff8f8f8),
//                       blurRadius: 10,
//                       spreadRadius: 10),
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
