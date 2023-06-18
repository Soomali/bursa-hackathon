import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    notifier.get(id: victimId);

    return BackgroundPage(
        child: ChangeNotifierProvider.value(
      value: notifier,
      child: Builder(builder: (context) {
        return ErrorHandlerProvider<VictimChangeNotifier>(
            onErrorHandled: (_) => Navigator.of(context).pop(),
            errorIds: [ErrorIdConstants.victimGetErrorId],
            child:
                Consumer<VictimChangeNotifier>(builder: (context, notifier, _) {
              if (notifier.state == AsyncChangeNotifierState.busy) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              final model = notifier.data!;
              return Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Material(
                    elevation: 2,
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black54),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          SvgPicture.asset(
                            'assets/injured_person.svg',
                            width: 48,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '${model.name} ${model.surname}',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Çadır kent numarası: ${model.tentCityId} ',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Çadır numarası: ${model.tent_number} ',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          if (model.additional_data != null)
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * .15),
                              child: Text.rich(TextSpan(
                                  text: 'hakkında ek bilgi:',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  children: [
                                    TextSpan(
                                        text: ' ${model.additional_data}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal))
                                  ])),
                            ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              OutlinedButton(
                                  onPressed: () {
                                    notifier.addMovement(
                                        victimId,
                                        MovementModel(
                                            time: Timestamp.now(),
                                            movement: Movement.out));
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Çıkış Yaptı')),
                              OutlinedButton(
                                  onPressed: () {
                                    notifier.addMovement(
                                        victimId,
                                        MovementModel(
                                            time: Timestamp.now(),
                                            movement: Movement.into));
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Giriş Yaptı')),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }));
      }),
    ));
  }
}
