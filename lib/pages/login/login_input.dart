import 'package:flutter/material.dart';

class login_input extends StatefulWidget {
  const login_input({Key? key}) : super(key: key);

  @override
  State<login_input> createState() => _login_inputState();
}

class _login_inputState extends State<login_input> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: null,
      maxLength: null,
      inputFormatters: null,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        hintText: null,
      ),
    );
  }
}
