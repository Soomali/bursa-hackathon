import 'package:flutter/material.dart';

class LoginButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String title;
  const LoginButton({Key? key, required this.onPressed, required this.title})
      : super(key: key);

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 50,
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          primary: Colors.redAccent.shade700,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ),
        child: Text(style: TextStyle(color: Colors.white), widget.title),
      ),
    );
  }
}
