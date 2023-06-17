import 'package:flutter/material.dart';

class LoginInput extends StatefulWidget {
  TextInputType keyboardType;
  int maxLength;
  String hintText;
  void Function(String)? onChanged;
  bool obsecureText;

  LoginInput(
      {Key? key,
      this.onChanged,
      this.obsecureText = false,
      required this.hintText,
      required this.keyboardType,
      required this.maxLength})
      : super(key: key);

  @override
  State<LoginInput> createState() => _LoginInputState();
}

class _LoginInputState extends State<LoginInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: TextFormField(
        keyboardType: widget.keyboardType,
        maxLength: widget.maxLength,
        onChanged: widget.onChanged,
        obscureText: widget.obsecureText,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          hintText: widget.hintText,
        ),
      ),
    );
  }
}
