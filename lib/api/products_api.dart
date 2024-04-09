import 'dart:math';

import 'package:collection/collection.dart';

class ProductsAPI {
  static final List<Map<String, dynamic>> _products = [
    {
      'id': 1,
      'user_id': 1,
      'name': '"Молоко 3,2% для дітей Яготинське т/п 1000g',
      'image': 'https://picsum.photos/200/300/?1',
      'description':
          'An apple is an edible fruit produced by an apple tree (Malus domestica). Apple trees are cultivated worldwide and are the most widely grown species in the genus Malus. The tree originated in Central Asia, where its wild ancestor, Malus sieversii, is still found today',
      'ingredients': ['juice', 'sugar', 'water'],
      "barcode": "4823005203742",
      "code": "E101",
    },
    {
      'id': 1,
      'user_id': 1,
      'name': 'Масло Бутербродне ферма 63%',
      'image': 'https://picsum.photos/200/300/?1',
      'description':
          'An apple is an edible fruit produced by an apple tree (Malus domestica). Apple trees are cultivated worldwide and are the most widely grown species in the genus Malus. The tree originated in Central Asia, where its wild ancestor, Malus sieversii, is still found today',
      'ingredients': ['juice', 'sugar', 'water'],
      "barcode": "4820239242806",
      "code": "E230",
    },
    {
      'id': 1,
      'user_id': 1,
      'name':
          'name": "Крекер зі смаком цибулі та сметани The Crackers Yarych м/y 80g',
      'image': 'https://picsum.photos/200/300/?1',
      'description':
          'An apple is an edible fruit produced by an apple tree (Malus domestica). Apple trees are cultivated worldwide and are the most widely grown species in the genus Malus. The tree originated in Central Asia, where its wild ancestor, Malus sieversii, is still found today',
      'ingredients': ['juice', 'sugar', 'water'],
      "barcode": "4820154483841",
      "code": "E231",
    },
    {
      'id': 1,
      'user_id': 1,
      'name': 'Макаронні вироби PASTA PRIMA 800g',
      'image': 'https://picsum.photos/200/300/?1',
      'description':
          'An apple is an edible fruit produced by an apple tree (Malus domestica). Apple trees are cultivated worldwide and are the most widely grown species in the genus Malus. The tree originated in Central Asia, where its wild ancestor, Malus sieversii, is still found today',
      'ingredients': ['juice', 'sugar', 'water'],
      "barcode": "4820156761619",
      "code": "E232",
    },
    {
      'id': 1,
      'user_id': 1,
      'name': 'Борошно пшеничне Зерновита м/y 2кg.',
      'image': 'https://picsum.photos/200/300/?1',
      'description':
          'An apple is an edible fruit produced by an apple tree (Malus domestica). Apple trees are cultivated worldwide and are the most widely grown species in the genus Malus. The tree originated in Central Asia, where its wild ancestor, Malus sieversii, is still found today',
      'ingredients': ['juice', 'sugar', 'water'],
      "barcode": "4820197780150",
      "code": "E233",
    },
    {
      'id': 1,
      'user_id': 1,
      'name': 'Олія оливкова Arioli Extra Virgen 500мл',
      'image': 'https://picsum.photos/200/300/?1',
      'description':
          'An apple is an edible fruit produced by an apple tree (Malus domestica). Apple trees are cultivated worldwide and are the most widely grown species in the genus Malus. The tree originated in Central Asia, where its wild ancestor, Malus sieversii, is still found today',
      'ingredients': ['juice', 'sugar', 'water'],
      "barcode": "8004825008007",
      "code": "E234",
    },
    {
      'id': 1,
      'user_id': 1,
      'name': 'Крупа гречана ядриця Зерновита м/y 1кg',
      'image': 'https://picsum.photos/200/300/?1',
      'description':
          'An apple is an edible fruit produced by an apple tree (Malus domestica). Apple trees are cultivated worldwide and are the most widely grown species in the genus Malus. The tree originated in Central Asia, where its wild ancestor, Malus sieversii, is still found today',
      'ingredients': ['juice', 'sugar', 'water'],
      "barcode": "4820197780730",
      "code": "E235",
    },
    {
      'id': 1,
      'user_id': 1,
      'name': 'Паштет курячий з журавлиною Екстра Шпік лоток 130g',
      'image': 'https://picsum.photos/200/300/?1',
      'description':
          'An apple is an edible fruit produced by an apple tree (Malus domestica). Apple trees are cultivated worldwide and are the most widely grown species in the genus Malus. The tree originated in Central Asia, where its wild ancestor, Malus sieversii, is still found today',
      'ingredients': ['juice', 'sugar', 'water'],
      "barcode": "4820038920219",
      "code": "E236",
    },
    {
      'id': 1,
      'user_id': 1,
      'name': 'Паштет курячий з журавлиною Екстра Шпік лоток 130g',
      'image': 'https://picsum.photos/200/300/?1',
      'description':
          'An apple is an edible fruit produced by an apple tree (Malus domestica). Apple trees are cultivated worldwide and are the most widely grown species in the genus Malus. The tree originated in Central Asia, where its wild ancestor, Malus sieversii, is still found today',
      'ingredients': ['juice', 'sugar', 'water'],
      "barcode": "5907670901468",
      "code": "E237",
    },
    {
      'id': 1,
      'user_id': 1,
      'name': 'Маслини чорні без кісточки Lorado з/б 314мл',
      'image': 'https://picsum.photos/200/300/?1',
      'description':
          'An apple is an edible fruit produced by an apple tree (Malus domestica). Apple trees are cultivated worldwide and are the most widely grown species in the genus Malus. The tree originated in Central Asia, where its wild ancestor, Malus sieversii, is still found today',
      'ingredients': ['juice', 'sugar', 'water'],
      "barcode": "4008638275131",
      "code": "E238",
    },
    {
      'id': 1,
      'user_id': 1,
      'name': 'Маслини чорні без кісточки Lorado з/б 314мл',
      'image': 'https://picsum.photos/200/300/?1',
      'description':
          'An apple is an edible fruit produced by an apple tree (Malus domestica). Apple trees are cultivated worldwide and are the most widely grown species in the genus Malus. The tree originated in Central Asia, where its wild ancestor, Malus sieversii, is still found today',
      'ingredients': ['juice', 'sugar', 'water'],
      "barcode": "4820234610211",
      "code": "E239",
    },
    {
      'id': 1,
      'user_id': 1,
      'name':
          'Трубочки мультизлакові зі справжнім сиром Yellow Cheese Brunch м/y 120g',
      'image': 'https://picsum.photos/200/300/?1',
      'description':
          'An apple is an edible fruit produced by an apple tree (Malus domestica). Apple trees are cultivated worldwide and are the most widely grown species in the genus Malus. The tree originated in Central Asia, where its wild ancestor, Malus sieversii, is still found today',
      'ingredients': ['juice', 'sugar', 'water'],
      "barcode": "4823105805280",
      "code": "E240",
    },
    {
      'id': 1,
      'user_id': 1,
      'name': 'ЧІПСИ PRINGLES ПАПРИКА',
      'image': 'https://picsum.photos/200/300/?1',
      'description':
          'An apple is an edible fruit produced by an apple tree (Malus domestica). Apple trees are cultivated worldwide and are the most widely grown species in the genus Malus. The tree originated in Central Asia, where its wild ancestor, Malus sieversii, is still found today',
      'ingredients': ['juice', 'sugar', 'water'],
      "barcode": "5053990161614",
      "code": "E243",
    },
    {
      'id': 1,
      'user_id': 1,
      'name': 'ПЕЧИВО Oreo 176g',
      'image': 'https://picsum.photos/200/300/?1',
      'description':
          'An apple is an edible fruit produced by an apple tree (Malus domestica). Apple trees are cultivated worldwide and are the most widely grown species in the genus Malus. The tree originated in Central Asia, where its wild ancestor, Malus sieversii, is still found today',
      'ingredients': ['juice', 'sugar', 'water'],
      "barcode": "7622300444181",
      "code": "E244",
    },
    {
      'id': 1,
      'user_id': 1,
      'name': 'ЯЙЦЯ КУРЯЧІ 10ШT',
      'image': 'https://picsum.photos/200/300/?1',
      'description':
          'An apple is an edible fruit produced by an apple tree (Malus domestica). Apple trees are cultivated worldwide and are the most widely grown species in the genus Malus. The tree originated in Central Asia, where its wild ancestor, Malus sieversii, is still found today',
      'ingredients': ['juice', 'sugar', 'water'],
      "barcode": "4820261650082",
      "code": "E245",
    },
    {
      'id': 1,
      'user_id': 1,
      'name': 'ПОПКОРН З СІЛЛЮ BOOMZA! M/Y 30Г',
      'image': 'https://picsum.photos/200/300/?1',
      'description':
          'An apple is an edible fruit produced by an apple tree (Malus domestica). Apple trees are cultivated worldwide and are the most widely grown species in the genus Malus. The tree originated in Central Asia, where its wild ancestor, Malus sieversii, is still found today',
      'ingredients': ['juice', 'sugar', 'water'],
      "barcode": "4820196732051",
      "code": "E246",
    },
    {
      'id': 1,
      'user_id': 1,
      'name': 'МОРОЗИВО ДЕСЕРТ-МОРОЗИВО РУДЬ M/Y 400Г',
      'image': 'https://picsum.photos/200/300/?1',
      'description':
          'An apple is an edible fruit produced by an apple tree (Malus domestica). Apple trees are cultivated worldwide and are the most widely grown species in the genus Malus. The tree originated in Central Asia, where its wild ancestor, Malus sieversii, is still found today',
      'ingredients': ['juice', 'sugar', 'water'],
      "barcode": "4823097812648",
      "code": "E248",
    },
  ];

  static Map<String, dynamic>? findProductByBarcode(String barcode) {
    final product = _products.firstWhereOrNull(
      (product) => product['barcode'] == barcode,
    );

    return product != null ? Map<String, dynamic>.from(product) : null;
  }

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
