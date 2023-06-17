import 'package:flutter/material.dart';

class ComplaintButton extends StatefulWidget {
  final VoidCallback onPressed;
  const ComplaintButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  State<ComplaintButton> createState() => _ComplaintButtonState();
}

class _ComplaintButtonState extends State<ComplaintButton> {
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
        child: Text(style: TextStyle(color: Colors.white), "Gönder"),
      ),
    );
  }
}
