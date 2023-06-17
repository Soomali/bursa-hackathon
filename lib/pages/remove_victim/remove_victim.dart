import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_tent_city_app/notifiers/async_change_notifier_state.dart';
import 'package:smart_tent_city_app/notifiers/victim_change_notifier.dart/victim_change_notifier.dart';
import 'package:smart_tent_city_app/pages/background_page.dart';
import 'package:smart_tent_city_app/pages/remove_victim/remove_victim_body.dart';

class RemoveVictim extends StatelessWidget {
  const RemoveVictim({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundPage(
        child: ChangeNotifierProvider.value(
      value: VictimChangeNotifier(),
      child: Builder(builder: (context) {
        return Consumer<VictimChangeNotifier>(builder: (context, notifier, _) {
          if (notifier.state == AsyncChangeNotifierState.busy) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              showDialog(
                  context: context,
                  builder: (context) => Center(
                        child: CircularProgressIndicator(),
                      ));
            });
          }
          if (notifier.state == AsyncChangeNotifierState.done) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            });
          }
          return RemoveVictimBody();
        });
      }),
    ));
  }
}
