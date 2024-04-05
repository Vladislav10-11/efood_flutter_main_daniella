import 'package:efood_flutter/api/auth_api.dart';
import 'package:efood_flutter/components/additives_card.dart';
import 'package:efood_flutter/components/footer.dart';
import 'package:efood_flutter/components/header.dart';
import 'package:flutter/material.dart';

import '../api/additives_api.dart';

class AdditivesPage extends StatefulWidget {
  const AdditivesPage({super.key, required String barcode});
  @override
  State<AdditivesPage> createState() => _AdditivesPageState();
}

class _AdditivesPageState extends State<AdditivesPage> {
  String _search = '';
  List<Map<String, dynamic>> _results = [];

  bool _busy = false;

  void _executeSearch() async {
    if (_search.isEmpty) {
      setState(() {
        _results = [];
      });
      return;
    }

    setState(() {
      _busy = true;
    });

    final results = await AdditivesAPI.searchAdditives(_search);
    setState(() {
      _results = results;
      _busy = false;
    });
  }

  void _logout() async {
    await AuthAPI.logout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffbdbdbd),
      appBar: Header(),
      body:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Logged in as Food Admin with 2 allergies',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      _search = value;
                    });
                    _executeSearch();
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Search...',
                  ),
                ),
                ListView(
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: [
                    if (_busy)
                      Text(
                        'Loading...',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ..._results
                        .map((result) => AdditivesCard(
                              additive: result,
                              key: ValueKey(result['code']),
                            ))
                        .toList(),
                  ],
                )
              ],
            ),
          ),
        ),
        Expanded(flex: 1, child: Footer())
      ]),
    );
  }
}
