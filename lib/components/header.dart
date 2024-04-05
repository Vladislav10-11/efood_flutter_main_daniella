import 'package:efood_flutter/pages/additives_page.dart';
import 'package:efood_flutter/pages/home_page.dart';
import 'package:efood_flutter/pages/register_page.dart';
import 'package:flutter/material.dart';

import '../pages/login_page.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  final double height = 90.0;
  Size get preferredSize => Size.fromHeight(height);
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: height,
      backgroundColor: const Color(0xff343a40),
      title: Image.asset(
        'assets/images/logo.jpg',
        fit: BoxFit.contain,
        height: 50,
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: ((context) => const HomePage()),
              ),
            );
          },
          child: const Text('Search',
              style: TextStyle(fontSize: 16, color: Color(0xff6c757d))),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: ((context) => const AdditivesPage(
                      barcode: '',
                    )),
              ),
            );
          },
          child: const Text('addivities',
              style: TextStyle(fontSize: 16, color: Color(0xff6c757d))),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: ((context) => const LoginPage()),
              ),
            );
          },
          child: const Text('Login',
              style: TextStyle(fontSize: 16, color: Color(0xff6c757d))),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: ((context) => const RegisterPage()),
              ),
            );
          },
          child: const Text('Register',
              style: TextStyle(fontSize: 16, color: Color(0xff6c757d))),
        ),
      ],
    );
  }
}
