import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_tent_city_app/notifiers/pagination_change_notifier/requests_list_change_notifier.dart';
import 'package:smart_tent_city_app/notifiers/victim_change_notifier.dart/victim_change_notifier.dart';
import 'package:smart_tent_city_app/pages/background_page.dart';
import 'package:smart_tent_city_app/pages/victim/my_requests/my_requests_body.dart';

class MyRequestsPage extends StatelessWidget {
  const MyRequestsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = RequestsListChangeNotifier();
    final victimId =
        Provider.of<VictimChangeNotifier>(context, listen: false).data!.id;
    notifier.get(victimId: victimId);
    return ChangeNotifierProvider.value(
      value: notifier,
      child: BackgroundPage(child: MyRequestsBody()),
    );
  }
}
