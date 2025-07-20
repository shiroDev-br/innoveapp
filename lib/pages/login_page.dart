import 'dart:convert';

import 'package:app_innove/components/login_components/login_form.dart';
import 'package:app_innove/components/login_components/login_header.dart';
import 'package:app_innove/utils/cache.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
    checkLogin(context);
  }

  Future<void> login(BuildContext context, String email, String cpf) async {
    final response = await http.post(
      Uri.parse("https://innoveappapi-production.up.railway.app/login"),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'cpf': cpf}),
    );

    if (!context.mounted) return;

    if (response.statusCode == 401) {
      print(response.body);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'E-mail ou CPF incorretos',
            style: TextStyle(color: Colors.white),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          backgroundColor: Colors.redAccent,
          duration: const Duration(milliseconds: 1500),
        ),
      );
      return;
    }

    if (response.statusCode == 200) {
      storeCache('token', response.bodyBytes);
      print(response.body);
      Navigator.of(context).pushReplacementNamed('/home');
    } else {
      print(response.body);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Erro no servidor. Código: ${response.statusCode}',
            style: TextStyle(color: Colors.white),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          backgroundColor: Colors.redAccent,
          duration: const Duration(milliseconds: 1500),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LoginHeader(),
              SizedBox(height: 30),
              LoginForm(onLogin: login),
            ],
          ),
        ),
      ),
    );
  }
}
