import 'package:efood_flutter/api/auth_api.dart';
import 'package:efood_flutter/api/products_api.dart';
import 'package:efood_flutter/components/additives_card.dart';
import 'package:efood_flutter/components/footer.dart';
import 'package:efood_flutter/components/header.dart';
import 'package:efood_flutter/components/product_card.dart';
import 'package:efood_flutter/pages/additives_page.dart';
import 'package:efood_flutter/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

    final results = await ProductsAPI.searchProducts(_search);
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
                  '🍔 Start typing name of a product to view it\'s details',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    if (AuthAPI.user != null)
                      Text(
                        'Logged in as ${AuthAPI.user.name} with ${AuthAPI.user.allergies.length} allergies',
                      ),
                    if (AuthAPI.user == null)
                      Expanded(
                        child: Text(
                          'Allergic reactions will be shown only for registered users.',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    TextButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => LoginPage()),
                        ),
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.blue, fontSize: 16),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: _scanBarcode,
                  child: Text('Scan Barcode'),
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
                if (_busy)
                  Text(
                    'Loading...',
                    style: TextStyle(color: Colors.grey),
                  ),
                ..._results.map((result) => ProductCard(
                      product: result,
                      key: ValueKey(result['id']),
                    )),
              ],
            ),
          ),
        ),
        Expanded(flex: 1, child: Footer())
      ]),
    );
  }

  Future<void> _scanBarcode() async {
    try {
      String barcode = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);

      if (barcode != '-1') {
        if (barcode == 'ABC-abc-1234') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Scaffold(
                appBar: AppBar(
                  title: Text('Additives Card'),
                ),
                body: Center(
                  child: AdditivesCard(
                    additive: {
                      'code': barcode,
                      'name': 'Sample Name',
                      'purpose': 'Sample Purpose',
                      'status': 'Approved'
                    },
                  ),
                ),
              ),
            ),
          );
        } else {
          setState(() {
            _search = barcode;
          });
          _executeSearch();
        }
      }
    } catch (e) {
      print('Error while scanning barcode: $e');
    }
  }
}
