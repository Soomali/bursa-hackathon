import 'package:flutter/material.dart';
import 'package:smart_tent_city_app/pages/background_page.dart';
import 'package:smart_tent_city_app/pages/executive/create_victim/create_victim.dart';
import 'package:smart_tent_city_app/pages/executive/create_victim/create_victim_body.dart';
import 'package:smart_tent_city_app/pages/executive/remove_victim/remove_victim.dart';
import 'package:smart_tent_city_app/pages/executive/search_victim/search_victim.dart';
import 'package:smart_tent_city_app/pages/executive/victim_processes/victim_process_option.dart';

class VictimProcesses extends StatefulWidget {
  const VictimProcesses({super.key});

  @override
  State<VictimProcesses> createState() => _VictimProcessesState();
}

class _VictimProcessesState extends State<VictimProcesses> {
  late List<Widget> _pages = [
    VictimOptionsWidget(
      onTap: (val) {
        setState(() {
          _currentPage = val + 1;
        });
      },
    ),
    CreateVictim(
      onFinished: resetState,
    ),
    RemoveVictim(onFinished: resetState),
    SearchVictim(onFinished: resetState)
  ];
  void resetState() {
    setState(() {
      _currentPage = 0;
    });
  }

  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return BackgroundPage(child: _pages[_currentPage]);
  }
}

class VictimOptionsWidget extends StatelessWidget {
  const VictimOptionsWidget({
    super.key,
    required this.onTap,
  });
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VictimProcessOption(
            label: 'Depremzede Kaydet',
            iconPath: 'assets/injured_person.svg',
            onPress: () {
              onTap(0);
            }),
        VictimProcessOption(
            label: 'Depremzede Sil',
            iconPath: 'assets/injured_person.svg',
            onPress: () {
              onTap(1);
            }),
        VictimProcessOption(
            label: 'Depremzede Ara',
            iconPath: 'assets/injured_person.svg',
            onPress: () {
              onTap(2);
            }),
      ],
    );
  }
}
