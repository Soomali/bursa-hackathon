import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_tent_city_app/notifiers/pagination_change_notifier/requests_list_change_notifier.dart';
import 'package:smart_tent_city_app/pages/background_page.dart';

class TentCityRequests extends StatelessWidget {
  const TentCityRequests({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = RequestsListChangeNotifier();

    return ChangeNotifierProvider.value(
      value: notifier,
      child: BackgroundPage(child: TentCityRequests()),
    );
  }
}
