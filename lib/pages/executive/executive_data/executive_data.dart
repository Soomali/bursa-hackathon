import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_tent_city_app/model/ExecutiveModel.dart';
import 'package:smart_tent_city_app/notifiers/executive_change_notifier/executive_change_notifier.dart';
import 'package:smart_tent_city_app/pages/background_page.dart';

class ExecutiveInfoPage extends StatelessWidget {
  const ExecutiveInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ExecutiveModel model =
        Provider.of<ExecutiveChangeNotifier>(context, listen: false).data!;
    return BackgroundPage(
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'İsim:${model.name} ${model.surname}',
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Çadırkent Numarası:${model.tentCityId}',
              )
            ],
          ),
        ),
      ),
    );
  }
}
