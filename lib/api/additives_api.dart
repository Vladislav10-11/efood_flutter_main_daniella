import 'dart:math';

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
