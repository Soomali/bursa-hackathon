import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_tent_city_app/model/RequestModel.dart';
import 'package:smart_tent_city_app/model/RequestStatus.dart';
import 'package:smart_tent_city_app/notifiers/request_change_notifier/request_change_notifier.dart';

class RequestDetailPage extends StatelessWidget {
  final RequestModel requestModel;
  final Widget Function(RequestModel, void Function(RequestModel),
      void Function(RequestModel)) buildWidget;
  const RequestDetailPage(
      {super.key, required this.requestModel, required this.buildWidget});

  void updateModel(RequestModel model, RequestStatus status,
      RequestChangeNotifier notifier, context) {
    model.status = status;
    notifier.update(model);
    Navigator.of(context).pop(model);
  }

  @override
  Widget build(BuildContext context) {
    final notifier = RequestChangeNotifier();
    notifier.data = requestModel.clone();

    return ChangeNotifierProvider.value(
      value: notifier,
      child: Builder(builder: (context) {
        return Consumer<RequestChangeNotifier>(
          builder: (context, notifier, _) {
            return buildWidget(notifier.data!, (model) {
              updateModel(model, RequestStatus.rejected, notifier, context);
            }, (model) {
              updateModel(model, RequestStatus.accepted, notifier, context);
            });
          },
        );
      }),
    );
  }
}
