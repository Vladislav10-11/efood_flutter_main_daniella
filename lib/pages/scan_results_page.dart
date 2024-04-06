import 'package:efood_flutter/components/additives_card.dart';
import 'package:flutter/material.dart';

class ScanResultScreen extends StatelessWidget {
  final String scannedBarcode;
  final List<Map<String, dynamic>> additivesData;

  const ScanResultScreen({
    required this.scannedBarcode,
    required this.additivesData,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? additive = additivesData.firstWhere(
      (additive) => additive['code'] == scannedBarcode,
      orElse: () => null!,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('results'),
      ),
      body: additive != null
          ? AdditivesCard(additive: additive!)
          : Center(
              child: Text('$scannedBarcode dont finded'),
            ),
    );
  }
}
