import 'package:efood_flutter/pages/additives_page.dart';
import 'package:flutter/material.dart';

class AdditivesCard extends StatelessWidget {
  final Map<String, dynamic> additive;

  const AdditivesCard({required this.additive, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black),
        color: additive['status'].toUpperCase().contains('NOT APPROVED')
            ? Colors.red
            : Colors.yellow,
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            additive['code'],
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            additive['name'],
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 8),
          Text(
            additive['purpose'],
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 8),
          Text(
            additive['status'],
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
