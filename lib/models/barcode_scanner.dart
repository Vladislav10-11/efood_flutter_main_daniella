// import 'package:flutter/material.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

// class BarCode extends StatefulWidget {
//   String _search = ''; // Поле для хранения значения штрихкода
//   List<Map<String, dynamic>> _results = [];
//   bool _busy = false;

//   Future<void> _scanBarcode() async {
//     try {
//       String barcode = await FlutterBarcodeScanner.scanBarcode(
//           '#ff6666', 'Cancel', true, ScanMode.BARCODE);

//       if (barcode != '-1') {
//         setState(() {
//           _search = barcode;
//           _results = []; // Очищаем результаты поиска перед новым поиском
//         });
//         // Здесь вы можете добавить дополнительную логику связанную с обработкой штрихкода
//       }
//     } catch (e) {
//       print('Error while scanning barcode: $e');
//     }
//   }

//   BarCode({super.key});

//   @override
//   State<BarCode> createState() => _BarCodeState();
// }

// class _BarCodeState extends State<BarCode> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold();
//   }
// }
