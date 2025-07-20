import 'package:flutter/material.dart';

class ElevatedButtonComponentized extends StatefulWidget {
  final Text textButton;
  final Function()? onpressed;
  final Color? backgroundColor;
  final EdgeInsets? padding;
  final double? elevation;
  const ElevatedButtonComponentized({
    super.key,
    required this.textButton,
    this.onpressed,
    this.backgroundColor,
    this.padding,
    this.elevation,
  });

  @override
  State<ElevatedButtonComponentized> createState() =>
      _ElevatedButtonComponentizedState();
}

class _ElevatedButtonComponentizedState
    extends State<ElevatedButtonComponentized> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onpressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.backgroundColor,
        padding: widget.padding,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        elevation: widget.elevation,
      ),
      child: widget.textButton,
    );
  }
}
