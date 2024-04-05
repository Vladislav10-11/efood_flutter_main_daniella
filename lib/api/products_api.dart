import 'dart:math';

class ProductsAPI {
  static final List<Map<String, dynamic>> _products = [
    {
      'id': 1,
      'user_id': 1,
      'name': 'Apple',
      'image': 'https://picsum.photos/200/300/?1',
      'description':
          'An apple is an edible fruit produced by an apple tree (Malus domestica). Apple trees are cultivated worldwide and are the most widely grown species in the genus Malus. The tree originated in Central Asia, where its wild ancestor, Malus sieversii, is still found today',
      'ingredients': ['juice', 'sugar', 'water'],
    },
    {
      'id': 2,
      'user_id': 1,
      'name': 'Nutella',
      'description':
          'is a brand of sweetened hazelnut cocoa spread. Nutella is manufactured by the Italian company Ferrero and was first introduced in 1964, although its first iteration dates to 1963.',
      'image': 'https://picsum.photos/200/300/?2',
      'ingredients': ['milk', 'sugar', 'water'],
    },
  ];

  static Future<List<Map<String, dynamic>>> searchProducts(String query) async {
    return Future.delayed(Duration(milliseconds: Random().nextInt(500)), () {
      return _products.where((product) {
        return product['name'].toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  static Future<void> addProduct(Map<String, dynamic> product) async {
    _products.add(product);
  }
}
