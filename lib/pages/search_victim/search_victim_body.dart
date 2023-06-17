import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_tent_city_app/notifiers/async_change_notifier_state.dart';
import 'package:smart_tent_city_app/notifiers/pagination_change_notifier/victim_list_change_notifier.dart';
import 'package:smart_tent_city_app/notifiers/victim_change_notifier.dart/victim_change_notifier.dart';
import 'package:smart_tent_city_app/pages/search_victim/search_input.dart';
import 'package:smart_tent_city_app/pages/search_victim/victim_card.dart';
import 'package:smart_tent_city_app/util/utils.dart';

class SearchVictimPageBody extends StatefulWidget {
  const SearchVictimPageBody({super.key});

  @override
  State<SearchVictimPageBody> createState() => _SearchVictimPageBodyState();
}

class _SearchVictimPageBodyState extends State<SearchVictimPageBody> {
  String searchQuery = '';
  Timer t = Timer(Duration(milliseconds: 250), () {});
  final ScrollController _controller = ScrollController();
  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.position.maxScrollExtent == _controller.offset) {
        search();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    t.cancel();
  }

  void search() {
    final victimListNotifier =
        Provider.of<VictimListChangeNotifier>(context, listen: false);
    if (victimListNotifier.state == AsyncChangeNotifierState.busy) {
      return;
    }
    if (isNumeric(searchQuery)) {
      victimListNotifier.get(phoneNumber: searchQuery);
    } else {
      victimListNotifier.get(fullName: searchQuery);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<VictimListChangeNotifier>(builder: (context, notifier, _) {
      Widget widget;
      if (notifier.data != null &&
          notifier.data!.isEmpty &&
          notifier.state == AsyncChangeNotifierState.busy) {
        widget = Expanded(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      } else if (notifier.data == null || notifier.data!.isEmpty) {
        widget = Expanded(child: Center(child: Text('Sonuç Bulunamadı')));
      } else {
        widget = Expanded(
            child: ListView.builder(
          itemBuilder: (context, index) => VictimCard(
            victimModel: notifier.data![index],
          ),
          itemCount: notifier.data!.length,
        ));
      }
      return Column(
        children: [
          SearchInput(
            onChanged: (val) {
              setState(() {
                searchQuery = val;
              });
              t.cancel();
              t = Timer(Duration(milliseconds: 250), () {
                search();
              });
            },
          ),
          widget
        ],
      );
    });
  }
}
