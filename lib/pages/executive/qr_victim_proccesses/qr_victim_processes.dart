import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_tent_city_app/constants/error_ids.dart';
import 'package:smart_tent_city_app/model/VictimModel.dart';
import 'package:smart_tent_city_app/model/movement_model.dart';
import 'package:smart_tent_city_app/notifiers/async_change_notifier_state.dart';
import 'package:smart_tent_city_app/notifiers/victim_change_notifier.dart/victim_change_notifier.dart';
import 'package:smart_tent_city_app/pages/background_page.dart';
import 'package:smart_tent_city_app/pages/provider/error_handler/error_handler_provider.dart';

class QrVictimProcesses extends StatelessWidget {
  final String victimId;
  const QrVictimProcesses({super.key, required this.victimId});

  @override
  Widget build(BuildContext context) {
    VictimChangeNotifier notifier = VictimChangeNotifier();
    notifier.get(victimId);

    return BackgroundPage(
        child: ChangeNotifierProvider.value(
      value: notifier,
      child: Builder(builder: (context) {
        return ErrorHandlerProvider<VictimChangeNotifier>(
            onErrorHandled: (_) => Navigator.of(context).pop(),
            errorIds: [ErrorIdConstants.victimGetErrorId],
            child:
                Consumer<VictimChangeNotifier>(builder: (context, notifier, _) {
              return Row(
                children: [
                  TextButton(
                      onPressed: () {
                        notifier.addMovement(
                            victimId,
                            MovementModel(
                                time: Timestamp.now(),
                                movement: Movement.into));
                        Navigator.of(context).pop();
                      },
                      child: Text('Giriş Yaptı')),
                  TextButton(
                      onPressed: () {
                        notifier.addMovement(
                            victimId,
                            MovementModel(
                                time: Timestamp.now(), movement: Movement.out));
                        Navigator.of(context).pop();
                      },
                      child: Text('Çıkış Yaptı')),
                ],
              );
            }));
      }),
    ));
  }
}
