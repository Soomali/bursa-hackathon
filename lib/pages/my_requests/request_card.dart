import 'package:flutter/material.dart';
import 'package:smart_tent_city_app/model/RequestModel.dart';

class RequestCard extends StatelessWidget {
  final RequestModel requestModel;
  const RequestCard({super.key, required this.requestModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 500,
    );
  }
}
