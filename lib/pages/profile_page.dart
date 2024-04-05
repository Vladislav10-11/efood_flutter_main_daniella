import 'package:efood_flutter/api/auth_provider.dart';
import 'package:efood_flutter/components/head_profile.dart';
import 'package:efood_flutter/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  String _password = '';
  String _inputAllergies = '';
  bool _success = false;
  bool _error = false;

  void _save() {
    if (_formKey.currentState!.validate()) {
      // Call an async function to update the user's profile
      _success = true;
    }
  }

  void _logout() {
    // Call an async function to log out the user
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  void initState() {
    super.initState();
    // Call an async function to get the user's profile and set the initial values of the form
    final user = context.read<AuthProvider>().user;
    _name = user?.name ?? "John Doe";
    _email = user?.email ?? "johndoe@example.com";
    _password = user?.password ?? "password";
    _inputAllergies = user?.allergies.join(' ,') ?? "Peanuts, Shellfish";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HeaderProfile(),
      backgroundColor: const Color(0xffbdbdbd),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <
                  Widget>[
            const Center(
              child: Text(
                '🍔 DeFood',
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            const Center(
                child: Text(
              'Email',
              style: TextStyle(fontSize: 20),
            )),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              decoration:
                  const InputDecoration(filled: true, fillColor: Colors.white),
              initialValue: _email,
              enabled: false,
            ),
            const SizedBox(
              height: 20,
            ),
            const Center(
                child: Text(
              'Name',
              style: TextStyle(fontSize: 20),
            )),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
              ),
              initialValue: _name,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
              onSaved: (value) {
                _name = value!;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            const Center(
                child: Text(
              'Password',
              style: TextStyle(fontSize: 20),
            )),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration:
                  const InputDecoration(filled: true, fillColor: Colors.white),
              initialValue: _password,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
              onSaved: (value) {
                _password = value!;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            const Center(
                child: Text(
              'Allergies, separated by comma',
              style: TextStyle(fontSize: 20),
            )),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration:
                  const InputDecoration(filled: true, fillColor: Colors.white),
              initialValue: _inputAllergies,
              onChanged: (value) {
                _inputAllergies = value;
              },
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: _save,
              child: const Text('Save'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
              onPressed: _logout,
              child: const Text(
                'Logout',
                style: TextStyle(color: Colors.black),
              ),
            ),
            if (_error)
              const Text(
                'An error occurred while saving your changes',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            if (_success)
              const Text(
                'Changes saved',
              )
          ]),
        ),
      ),
    );
  }
}
