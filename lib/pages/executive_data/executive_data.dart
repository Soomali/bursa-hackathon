import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_tent_city_app/model/ExecutiveModel.dart';
import 'package:smart_tent_city_app/notifiers/executive_change_notifier/executive_change_notifier.dart';

class ExecutiveInfoPage extends StatelessWidget {
  const ExecutiveInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ExecutiveModel model =
        Provider.of<ExecutiveChangeNotifier>(context, listen: false).data!;
    return Column(
      children: [
        Text('İsim:${model.name} ${model.surname}'),
        Text('Çadırkent Numarası:${model.tentCityId}')
      ],
    );
  }
}
