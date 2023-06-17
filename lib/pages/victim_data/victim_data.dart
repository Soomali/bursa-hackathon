import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_tent_city_app/notifiers/victim_change_notifier.dart/victim_change_notifier.dart';
import 'package:smart_tent_city_app/pages/background_page.dart';

class VictimData extends StatelessWidget {
  const VictimData({super.key});

  @override
  Widget build(BuildContext context) {
    final victim =
        Provider.of<VictimChangeNotifier>(context, listen: false).data!;

    return BackgroundPage(
        child: SizedBox(
      width: double.infinity,
      child: Column(
        children: [],
      ),
    ));
  }
}
