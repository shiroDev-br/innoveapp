import 'package:app_innove/controllers/app_controller.dart';
import 'package:app_innove/pages/contracts_page.dart';
import 'package:app_innove/pages/home_page.dart';
import 'package:app_innove/pages/login_page.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AppController.instance,
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData(scaffoldBackgroundColor: Colors.black),
          initialRoute: '/',
          routes: {
            '/': (context) => const LoginPage(),
            '/home': (context) => const HomePage(),
            '/contracts': (context) => const ContractsPage(),
          },
        );
      },
    );
  }
}
