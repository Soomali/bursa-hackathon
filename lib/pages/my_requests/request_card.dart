import 'package:flutter/material.dart';
import 'package:smart_tent_city_app/model/RequestModel.dart';

class RequestCard extends StatelessWidget {
  final RequestModel requestModel;
  final VoidCallback? onTapReject;
  final VoidCallback? onTapAccept;
  const RequestCard(
      {super.key,
      required this.requestModel,
      this.onTapAccept,
      this.onTapReject});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.red,
        height: 250,
        width: 500,
        child: Row(
          children: [
            if (onTapReject != null)
              TextButton(onPressed: onTapReject, child: Text('Reddet')),
            if (onTapAccept != null)
              TextButton(onPressed: onTapAccept, child: Text('Kabul Et')),
          ],
        ),
      ),
    );
  }
}
