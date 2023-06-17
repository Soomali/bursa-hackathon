import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_tent_city_app/notifiers/pagination_change_notifier/victim_list_change_notifier.dart';
import 'package:smart_tent_city_app/pages/background_page.dart';
import 'package:smart_tent_city_app/pages/search_victim/search_victim_body.dart';

class SearchVictim extends StatelessWidget {
  const SearchVictim({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: VictimListChangeNotifier(),
      child: BackgroundPage(child: SearchVictimPageBody()),
    );
  }
}
