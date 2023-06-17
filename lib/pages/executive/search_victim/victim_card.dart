import 'package:flutter/material.dart';
import 'package:smart_tent_city_app/model/VictimModel.dart';

class VictimCard extends StatelessWidget {
  final VictimModel victimModel;
  const VictimCard({super.key, required this.victimModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.redAccent.shade700),
      ),
    );
  }
}
