import 'package:flutter/material.dart';
import 'package:smart_tent_city_app/pages/background_page.dart';
import 'package:smart_tent_city_app/pages/executive/create_victim/create_victim.dart';
import 'package:smart_tent_city_app/pages/executive/create_victim/create_victim_body.dart';
import 'package:smart_tent_city_app/pages/executive/remove_victim/remove_victim.dart';
import 'package:smart_tent_city_app/pages/executive/search_victim/search_victim.dart';
import 'package:smart_tent_city_app/pages/executive/victim_processes/victim_process_option.dart';

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
            onPress: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => CreateVictim()));
            }),
        VictimProcessOption(
            label: 'Depremzede Sil',
            iconPath: 'assets/injured_person.svg',
            onPress: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => RemoveVictim()));
            }),
        VictimProcessOption(
            label: 'Depremzede Ara',
            iconPath: 'assets/injured_person.svg',
            onPress: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SearchVictim()));
            }),
      ],
    ));
  }
}
