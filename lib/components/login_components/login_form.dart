import 'package:app_innove/components/elevatedButton.dart';
import 'package:app_innove/components/text_field.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  final Function(BuildContext context, String email, String cpf) onLogin;

  const LoginForm({super.key, required this.onLogin});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String email = '';
  String cpf = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFieldComponentized(
          placeHolder: 'E-mail',
          obscureText: false,
          onChange: (value) => email = value,
          icon: Icon(Icons.mail),
        ),
        SizedBox(height: 20),
        TextFieldComponentized(
          placeHolder: 'CPF',
          obscureText: true,
          onChange: (value) => cpf = value,
          icon: Icon(Icons.password),
        ),
        SizedBox(height: 40),
        ElevatedButtonComponentized(
          textButton: Text(
            'ENTRAR',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
              fontSize: 16,
            ),
          ),
          backgroundColor: Colors.redAccent,
          padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
          elevation: 5,
          onpressed: () {
            widget.onLogin(context, email, cpf);
          },
        ),
      ],
    );
  }
}
