import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_tent_city_app/notifiers/async_change_notifier_state.dart';
import 'package:smart_tent_city_app/notifiers/victim_change_notifier.dart/victim_change_notifier.dart';
import 'package:smart_tent_city_app/pages/background_page.dart';
import 'package:smart_tent_city_app/pages/executive/remove_victim/remove_victim_body.dart';

class RemoveVictim extends StatelessWidget {
  final VoidCallback onFinished;
  const RemoveVictim({super.key, required this.onFinished});

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    return WillPopScope(
      onWillPop: () async {
        onFinished();
        return false;
      },
      child: BackgroundPage(
        child: ChangeNotifierProvider.value(
          value: VictimChangeNotifier(),
          child: Builder(builder: (context) {
            return Consumer<VictimChangeNotifier>(
                builder: (context, notifier, _) {
              if (notifier.state == AsyncChangeNotifierState.busy &&
                  !isLoading) {
                isLoading = true;
                WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                  showDialog(
                      context: context,
                      builder: (context) => Center(
                            child: CircularProgressIndicator(),
                          ));
                });
              }
              if (notifier.state == AsyncChangeNotifierState.done &&
                  isLoading) {
                isLoading = false;
                WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                  Navigator.of(context).pop();
                  onFinished();
                });
              }
              return RemoveVictimBody();
            });
          }),
        ),
      ),
    );
  }
}
