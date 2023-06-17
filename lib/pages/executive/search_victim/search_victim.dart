import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_tent_city_app/notifiers/pagination_change_notifier/victim_list_change_notifier.dart';
import 'package:smart_tent_city_app/pages/background_page.dart';
import 'package:smart_tent_city_app/pages/executive/search_victim/search_victim_body.dart';

class SearchVictim extends StatelessWidget {
  final VoidCallback onFinished;
  const SearchVictim({super.key, required this.onFinished});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: VictimListChangeNotifier(),
      child: BackgroundPage(
          child: WillPopScope(
              onWillPop: () async {
                onFinished();
                return false;
              },
              child: SearchVictimPageBody())),
    );
  }
}
