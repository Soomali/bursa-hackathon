import 'package:flutter/material.dart';
import 'package:smart_tent_city_app/pages/background_page.dart';
import 'package:smart_tent_city_app/pages/victim_processes/victim_process_option.dart';

class VictimProcesses extends StatelessWidget {
  const VictimProcesses({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundPage(
        child: Column(
      children: [
        VictimProcessOption(
            label: 'Depremzede Kaydet',
            iconPath: 'assets/injured_person.svg',
            onPress: () {})
      ],
    ));
  }
}
