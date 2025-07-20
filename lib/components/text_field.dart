import 'package:flutter/material.dart';

class TextFieldComponentized extends StatefulWidget {
  final String placeHolder;
  final bool obscureText;
  final TextInputType? textInputType;
  final Icon? icon;
  final Function(String)? onChange;

  const TextFieldComponentized({
    super.key,
    required this.placeHolder,
    required this.obscureText,
    this.textInputType,
    this.onChange,
    this.icon,
  });

  @override
  State<TextFieldComponentized> createState() => _TextFieldComponentizedState();
}

class _TextFieldComponentizedState extends State<TextFieldComponentized> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: widget.textInputType,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.blueAccent.shade400, width: 2),
        ),
        label: Text(widget.placeHolder),
        filled: true,
        fillColor: Colors.grey[900],
        labelStyle: TextStyle(color: Colors.grey[400]),
        prefixIcon: widget.icon,
      ),
      onChanged: widget.onChange,
      style: TextStyle(color: Colors.white),
      cursorColor: Colors.redAccent.shade400,
    );
  }
}
