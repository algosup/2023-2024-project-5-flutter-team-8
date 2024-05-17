// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// void main() {
//   runApp(const MainApp());
// }

// class MainApp extends StatelessWidget {
//   const MainApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(scaffoldBackgroundColor: const Color(0xFF000000)),
//       home: Scaffold(
//         body: SafeArea(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               result(context),
//               row(context, ['AC', '+/-', '%', '÷']),
//               row(context, ['7', '8', '9', '×']),
//               row(context, ['4', '5', '6', '-']),
//               row(context, ['1', '2', '3', '+']),
//               row(context, ['0', '.', '=']),
//             ],
//           ),
//         ),
//       ), 
//     );
//   }

//   Widget textWidget(BuildContext context, String text) {
//     List<String> grey = ['AC', '+/-', '%'];
//     if (grey.contains(text)) {
//       return Text(
//         text,
//         style: const TextStyle(
//           color: Colors.black,
//           fontSize: 40,
//         ),
//       );
//     }
//     return Text(
//       text,
//       style: const TextStyle(
//         color: Colors.white,
//         fontSize: 40,
//       ),
//     );
//   }

//   Widget shapeWidget(BuildContext context, String keyValue) {
//     List<String> black = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '.'];
//     List<String> orange = ['÷', '×', '-', '+', '='];
//     List<String> grey = ['AC', '+/-', '%'];
//     if (black.contains(keyValue)) {
//       return Container(
//         decoration: const BoxDecoration(
//           color: Color.fromRGBO(80, 80, 80, 1),
//           shape: BoxShape.rectangle,
//           borderRadius: BorderRadius.all(Radius.circular(100)),
//         ),
//       );
//     }
//     if (orange.contains(keyValue)) {
//       return Container(
//         decoration: const BoxDecoration(
//           color: Color.fromRGBO(255, 149, 0, 1),
//           shape: BoxShape.rectangle,
//           borderRadius: BorderRadius.all(Radius.circular(100)),
//         ),
//       );
//     }
//     if (grey.contains(keyValue)) {
//       return Container(
//         decoration: const BoxDecoration(
//           color: Color.fromRGBO(212, 212, 210, 1),
//           shape: BoxShape.rectangle,
//           borderRadius: BorderRadius.all(Radius.circular(100)),
//         ),
//       );
//     }
//     return Container(
//       decoration: const BoxDecoration(
//         color: Color.fromRGBO(80, 80, 80, 1),
//         shape: BoxShape.rectangle,
//         borderRadius: BorderRadius.all(Radius.circular(100)),
//       ),
//     );
//   }

//   Widget button(BuildContext context, String keyValue, {double widthFactor = 1}) {
//   final size = MediaQuery.of(context).size;
//   const margin = 10.0;
//   Widget buttonChild;
//   if (keyValue == '0') {
//     buttonChild = GestureDetector(
//       onTap: () {
//         print('Button $keyValue tapped');
//       },
//       child: SizedBox(
//         width: (size.width - 5 * margin) / 4 * widthFactor * 2 + margin,
//         height: (size.width - 5 * margin) / 4,
//         child: Stack(
//           children: [
//             shapeWidget(context, keyValue),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(left: 30),
//                   child: textWidget(context, keyValue),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   } else {
//     buttonChild = GestureDetector(
//       onTap: () {
//         print('Button $keyValue tapped');
//       },
//       child: SizedBox(
//         width: (size.width - 5 * margin) / 4 * widthFactor,
//         height: (size.width - 5 * margin) / 4,
//         child: Stack(
//           children: [
//             shapeWidget(context, keyValue),
//             Center(child: textWidget(context, keyValue)),
//           ],
//         ),
//       ),
//     );
//   }

//   return buttonChild;
// }

//   Widget row(BuildContext context, List<String> keys) {
//     return Column(
//       children: [
//         const SizedBox(height: 10),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: keys.map((key) => button(context, key)).toList(),
//         ),
//       ],
//     );
//   }

//   Widget result(BuildContext context, String keyValue) {
//     if (keyValue == null) {
//       return Container(
//         padding: const EdgeInsets.all(20),
//         alignment: Alignment.centerRight,
//         child: Text(
//           '0',
//           style: const TextStyle(
//             color: Colors.white,
//             fontSize: 100,
//           ),
//         ),
//       );
//     }
//   }

//   // double result = 0;

//   String onPressed(String keyValue) {
//     return keyValue;
//   }
// }