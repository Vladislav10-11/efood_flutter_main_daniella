import 'package:flutter/material.dart';
import 'package:efood_flutter/api/auth_api.dart';
import 'package:efood_flutter/components/additives_card.dart';
import 'package:efood_flutter/components/footer.dart';
import 'package:efood_flutter/components/header.dart';
import 'package:efood_flutter/api/additives_api.dart';

class AdditivesPage extends StatefulWidget {
  final String barcode;

  const AdditivesPage({Key? key, required this.barcode}) : super(key: key);

  @override
  State<AdditivesPage> createState() => _AdditivesPageState();
}

class _AdditivesPageState extends State<AdditivesPage> {
  String _search = '';
  List<Map<String, dynamic>> _results = [];
  bool _busy = false;

  @override
  void initState() {
    super.initState();
    _search = widget
        .barcode; // Устанавливаем значение штрих-кода при инициализации страницы
    _executeSearch();
  }

  // Метод для выполнения поиска добавок
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

    // Ваша логика для поиска добавок
    // Например, вызов метода из API или фильтрация локального списка
    // final results = await AdditivesAPI.searchAdditives(_search);
    // setState(() {
    //   _results = results;
    //   _busy = false;
    // });
  }

  // Метод для выхода из аккаунта
  void _logout() async {
    await AuthAPI.logout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffbdbdbd),
      appBar: Header(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
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
                  ListView.builder(
                    itemCount: _results.length,
                    itemBuilder: (context, index) {
                      return AdditivesCard(
                        additive: _results[index],
                        key: ValueKey(_results[index]['code']),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Footer(),
          ),
        ],
      ),
    );
  }
}
