import 'package:flutter/material.dart';

class login_input extends StatefulWidget {
  TextInputType keyboardType;
  int maxLength;
  String hintText;

  login_input(
      {Key? key,
      required this.hintText,
      required this.keyboardType,
      required this.maxLength})
      : super(key: key);

  @override
  State<login_input> createState() => _login_inputState();
}

class _login_inputState extends State<login_input> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboardType,
      maxLength: widget.maxLength,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        hintText: widget.hintText,
      ),
    );
  }
}
