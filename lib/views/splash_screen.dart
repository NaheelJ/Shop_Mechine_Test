import 'package:flutter/material.dart';
import 'package:mechine_test/viewmodels/login_viewmodel.dart';
import 'package:mechine_test/views/home_page.dart';
import 'package:mechine_test/views/login_page.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  Future<void> _checkLogin(context) async {
    await Future.delayed(const Duration(seconds: 2));
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);
    final isLoggedIn = await loginProvider.checkLogin();

      if (isLoggedIn) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const HomePage()),
        );
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const LoginPage()),
        );
      }

  }

  @override
  Widget build(BuildContext context) {
    _checkLogin(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Icon(
                Icons.shopping_bag_outlined,
                size: 60,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'SHOP',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
                letterSpacing: 4,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Shopping Experience',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
                letterSpacing: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
