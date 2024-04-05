import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:collection/collection.dart';

final _storage = FlutterSecureStorage();

final List<Map<String, dynamic>> _users = [
  {
    'id': 1,
    'name': 'Food Admin',
    'password': 'admin',
    'email': 'admin@example.com',
    'allergies': ['E100', 'milk'],
  },
];

class AuthAPI {
  static const _accessTokenKey = 'access_token';

  static var user;

  Future<Map<String, dynamic>> login(String email, String password) async {
    final validUser = _users.firstWhereOrNull(
      (user) => user['email'] == email && user['password'] == password,
    );

    if (validUser == null) {
      throw Exception('Invalid username or password');
    }

    final token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.${base64Encode(validUser['id'].toString().codeUnits)}.very-secret-signature';

    await setAccessToken(token);

    return {
      'token': token,
      'user': validUser,
    };
  }

  Future<void> setAccessToken(String token) async {
    await _storage.write(key: _accessTokenKey, value: token);
  }

  Future<String?> getAccessToken() async {
    return await _storage.read(key: _accessTokenKey);
  }

  Future<void> removeAccessToken() async {
    await _storage.delete(key: _accessTokenKey);
  }

  Map<String, dynamic> register({
    required String email,
    required String name,
    required String password,
  }) {
    final existingUser =
        _users.firstWhereOrNull((user) => user['email'] == email);

    if (existingUser != null) {
      throw Exception('User already exists');
    }

    final user = {
      'id': _users.length + 1,
      'name': name,
      'email': email,
      'password': password,
      'allergies': [],
    };

    _users.add(user);

    return user;
  }

  Map<String, dynamic> whoami(String token) {
    final userId =
        int.tryParse(utf8.decode(base64.decode(token.split('.')[1])));
    final user =
        _users.firstWhere((user) => user['id'] == userId, orElse: () => null!);

    return user;
  }

  Future<Map<String, dynamic>> updateProfile({
    required String name,
    required List<String> allergies,
    required String password,
    required String token,
  }) async {
    final user = whoami(token);

    if (user == null) {
      throw Exception('Invalid token');
    }

    user['name'] = name;
    user['allergies'] = allergies;
    user['password'] = password;

    return user;
  }

  static logout() {}
}
