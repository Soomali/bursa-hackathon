import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_tent_city_app/notifiers/executive_change_notifier/executive_change_notifier.dart';
import 'package:smart_tent_city_app/notifiers/victim_change_notifier.dart/victim_change_notifier.dart';
import 'package:smart_tent_city_app/pages/login/login_button.dart';
import 'package:smart_tent_city_app/pages/login/login_input.dart';

class RemoveVictimBody extends StatefulWidget {
  const RemoveVictimBody({super.key});

  @override
  State<RemoveVictimBody> createState() => _RemoveVictimBodyState();
}

class _RemoveVictimBodyState extends State<RemoveVictimBody> {
  String name = '';
  String surname = '';
  String tentNumber = '';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          LoginInput(
              hintText: 'Kişinin adı',
              keyboardType: TextInputType.name,
              maxLength: 60),
          LoginInput(
              hintText: 'Kişinin soyadı',
              keyboardType: TextInputType.name,
              maxLength: 60),
          LoginInput(
              hintText: 'çadır numarası',
              keyboardType: TextInputType.number,
              maxLength: 5),
          LoginButton(onPressed: () {
            final executiveModel =
                Provider.of<ExecutiveChangeNotifier>(context, listen: false)
                    .data!;
            Provider.of<VictimChangeNotifier>(context, listen: false)
                .delete(name, surname, tentNumber, executiveModel.tentCityId);
          })
        ],
      ),
    );
  }
}