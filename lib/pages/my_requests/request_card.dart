import 'package:flutter/material.dart';
import 'package:smart_tent_city_app/model/RequestModel.dart';

class RequestCard extends StatelessWidget {
  final RequestModel requestModel;
  const RequestCard({super.key, required this.requestModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.red,
        height: 250,
        width: 500,
      ),
    );
  }
}
