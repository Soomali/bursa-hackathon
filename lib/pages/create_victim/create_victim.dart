import 'package:flutter/material.dart';
import 'package:smart_tent_city_app/pages/background_page.dart';
import 'package:smart_tent_city_app/pages/create_victim/create_victim_body.dart';

class CreateVictim extends StatelessWidget {
  const CreateVictim({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundPage(child: CreateVictimBody());
  }
}
