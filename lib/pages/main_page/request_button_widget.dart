import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RequestButtonWidget extends StatefulWidget {
  final String iconPath;
  final String data;

  const RequestButtonWidget({required this.iconPath, required this.data, Key? key})
      : super(key: key);

  @override
  State<RequestButtonWidget> createState() => _RequestButtonWidgetState();
}

class _RequestButtonWidgetState extends State<RequestButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: null,
      child: Column(
        children: [
          SvgPicture.asset(
            widget.iconPath,
            width: 80,
            height: 80,
          ),
          Text(widget.data),
        ],
      ),
    );
  }
}
