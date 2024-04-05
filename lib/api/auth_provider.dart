import 'package:efood_flutter/models/user.dart';
import 'package:efood_flutter/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../api/auth_api.dart';

class AuthProvider extends ChangeNotifier {
  String token = '';
  User? _user;

  User? get user => _user;

  Future<void> login(String email, String password) async {
    final result = await AuthAPI().login(email, password);
    final token = result['token'];
    _user = User.fromJson(result['user']);
    print('user ${_user}');
    print('result ${result}');
    notifyListeners();
    await AuthAPI().setAccessToken(token);
  }

  Future<void> logout() async {
    await AuthAPI().removeAccessToken();
    _user = null;
    notifyListeners();
  }

  Future<void> updateProfile(
      {required String name,
      required List<String> allergies,
      required String password}) async {
    final result = await AuthAPI().updateProfile(
        name: name, allergies: allergies, password: password, token: '');
    _user = result as User?;
    notifyListeners();
  }

  Future<void> register(
      {required String email,
      required String name,
      required String password}) async {
    final result =
        await AuthAPI().register(email: email, name: name, password: password);
    if (result != null) {
      _user = User.fromJson(result);
    }
    notifyListeners();
  }

  Future<void> whoami() async {
    final token = await AuthAPI().getAccessToken();
    if (token != null) {
      final result = await AuthAPI().whoami(token);
      _user = User.fromJson(result[user]);
      notifyListeners();
    }
  }

  bool isUserAllergicTo(String ingredient) {
    return _user?.allergies.contains(ingredient) ?? false;
  }
}

class Preview extends StatefulWidget {
  const Preview({Key? key}) : super(key: key);

  @override
  _PreviewState createState() => _PreviewState();
}

class _PreviewState extends State<Preview> {
  @override
  void initState() {
    super.initState();
    context.read<AuthProvider>().whoami();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    final isLoggedIn = authProvider.user != null;

    return Column(
      children: [
        if (isLoggedIn) Text('Welcome ${authProvider.user!.name}!'),
        if (!isLoggedIn)
          ElevatedButton(
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => ProfilePage()),
                ),
              );
            },
            child: const Text('Login'),
          ),
        if (isLoggedIn)
          ElevatedButton(
            onPressed: () async {
              await authProvider.logout();
            },
            child: const Text('Logout'),
          ),
      ],
    );
  }
}
