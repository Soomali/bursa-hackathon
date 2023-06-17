import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_tent_city_app/data/main_page_button_data/main_page_button_data.dart';

class RequestButtonWidget extends StatefulWidget {
  final MainPageButtonData buttonData;

  const RequestButtonWidget({required this.buttonData, Key? key})
      : super(key: key);

  @override
  State<RequestButtonWidget> createState() => _RequestButtonWidgetState();
}

class _RequestButtonWidgetState extends State<RequestButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style:
          ElevatedButton.styleFrom(backgroundColor: Colors.redAccent.shade700),
      onPressed: () {
        widget.buttonData.onPress();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            widget.buttonData.iconPath,
            width: 80,
            height: 80,
          ),
          SizedBox(height: 7),
          Text(widget.buttonData.textData),
        ],
      ),
    );
  }
}
