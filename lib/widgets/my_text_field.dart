import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;

  const MyTextField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.keyboardType,
  });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(hintText: widget.hintText),
      ),
    );
  }
}
