import 'dart:math';

import 'package:collection/collection.dart';

class AdditivesAPI {
  static final List<Map<String, dynamic>> _additives = [
    {
      "code": "E101",
      "name": "Riboflavin (Vitamin B2), formerly called lactoflavin",
      "purpose": "Yellow-orange",
      "status": "Approved in the EU.[9] Approved in the US.[10]"
    },
    {
      "code": "E230",
      "name": "Biphenyl, diphenyl",
      "purpose": "preservative",
      "status": "Not approved in the EU."
    },
    {
      "code": "E345",
      "name": "Magnesium citrate",
      "purpose": "acidity regulator",
      "status": ""
    }
  ];

  static List<Map<String, dynamic>> _barcodes = [
    {
      "barcode": "4823005203742",
      "code": "E101",
      "name": "Молоко 3,2% для дітей Яготинське т/п 1000g",
    },
    {
      "barcode": "4820239242806",
      "code": "E230",
      "name": "Масло Бутербродне ферма 63%",
    },
    {
      "barcode": "4820154483841",
      "code": "E231",
      "name": "Крекер зі смаком цибулі та сметани The Crackers Yarych м/y 80g",
    },
    {
      "barcode": "4820156761619",
      "code": "E232",
      "name": "Макаронні вироби 'Спіральки' PASTA PRIMA 800g",
    },
    {
      "barcode": "4820197780150",
      "code": "E233",
      "name": "Борошно пшеничне Зерновита м/y 2кg.",
    },
    {
      "barcode": "8004825008007",
      "code": "E234",
      "name": "Олія оливкова Arioli Extra Virgen 500мл",
    },
    {
      "barcode": "4820197780730",
      "code": "E235",
      "name": "Крупа гречана ядриця Зерновита м/y 1кg",
    },
    {
      "barcode": "4820197780730",
      "code": "E235",
      "name": "Крупа гречана ядриця Зерновита м/y 1кg",
    },
    {
      "barcode": "4820038920219",
      "code": "E236",
      "name": "Рис довгозернистий Зерновита м/y 1кg",
    },
    {
      "barcode": "4820038920219",
      "code": "E236",
      "name": "Рис довгозернистий Зерновита м/y 1кg",
    },
    {
      "barcode": "5907670901468",
      "code": "E237",
      "name": "Паштет курячий з журавлиною Екстра Шпік лоток 130g",
    },
    {
      "barcode": "4008638275131",
      "code": "E238",
      "name": "Маслини чорні без кісточки Lorado з/б 314мл",
    },
    {
      "barcode": "4820234610211",
      "code": "E239",
      "name": "Маслини чорні без кісточки Lorado з/б 314мл",
    },
    {
      "barcode": "4823105805280",
      "code": "E240",
      "name":
          "Трубочки мультизлакові зі справжнім сиром Yellow Cheese Brunch м/y 120g",
    },
    {
      "barcode": "8715700417332",
      "code": "E241",
      "name": "Кетчуп Heinz п/п 250мл",
    },
    {
      "barcode": "4820196681595",
      "code": "E242",
      "name": "МАЙОНЕЗ 67% ПРОВАНСАЛЬ ОДЕСЬКИЙ МАЙОНЕЗ C/Б 420Г",
    },
    {
      "barcode": "5053990161614",
      "code": "E243",
      "name": "ЧІПСИ PRINGLES ПАПРИКА",
    },
    {
      "barcode": "7622300444181",
      "code": "E244",
      "name": "ПЕЧИВО Oreo 176g",
    },
    {
      "barcode": "4820261650082",
      "code": "E245",
      "name": "ЯЙЦЯ КУРЯЧІ 10ШT",
    },
    {
      "barcode": "4820196732051",
      "code": "E246",
      "name": "ПОПКОРН З СІЛЛЮ BOOMZA! M/Y 30Г",
    },
    {
      "barcode": "4823097812648",
      "code": "E248",
      "name": " МОРОЗИВО ДЕСЕРТ-МОРОЗИВО РУДЬ M/Y 400Г",
    },
  ];

  static Map<String, dynamic>? findProductByBarcode(String barcode) {
    final product = _barcodes.firstWhereOrNull(
      (product) => product['barcode'] == barcode,
    );

    return product != null ? Map<String, dynamic>.from(product) : null;
  }

  static Future<List<Map<String, dynamic>>> searchAdditives(
      String query) async {
    return Future.delayed(Duration(milliseconds: Random().nextInt(500)), () {
      return _additives.where((aditive) {
        return aditive['code'].toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  static Future<void> addAdditive(Map<String, dynamic> additive) async {
    _additives.add(additive);
  }
}
