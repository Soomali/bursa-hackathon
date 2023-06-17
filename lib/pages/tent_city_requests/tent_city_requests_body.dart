import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_tent_city_app/notifiers/executive_change_notifier/executive_change_notifier.dart';
import 'package:smart_tent_city_app/notifiers/pagination_change_notifier/requests_list_change_notifier.dart';
import 'package:smart_tent_city_app/pages/background_page.dart';
import 'package:smart_tent_city_app/pages/tent_city_requests/tent_city_request_body.dart';

class TentCityRequests extends StatelessWidget {
  const TentCityRequests({super.key});

  @override
  Widget build(BuildContext context) {
    final tentCityId =
        Provider.of<ExecutiveChangeNotifier>(context).data!.tentCityId;
    final notifier = RequestsListChangeNotifier();
    notifier.get(tentCityId: tentCityId);

    return ChangeNotifierProvider.value(
      value: notifier,
      child: BackgroundPage(child: TentCityRequestBody()),
    );
  }
}
