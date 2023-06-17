import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_tent_city_app/notifiers/async_change_notifier_state.dart';
import 'package:smart_tent_city_app/notifiers/auth/executive_auth_change_notifier.dart';
import 'package:smart_tent_city_app/notifiers/executive_change_notifier/executive_change_notifier.dart';
import 'package:smart_tent_city_app/notifiers/pagination_change_notifier/requests_list_change_notifier.dart';
import 'package:smart_tent_city_app/pages/my_requests/request_card.dart';

class TentCityRequestBody extends StatefulWidget {
  const TentCityRequestBody({super.key});

  @override
  State<TentCityRequestBody> createState() => _TentCityRequestBodyState();
}

class _TentCityRequestBodyState extends State<TentCityRequestBody> {
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

  void search() {
    final tentCityId =
        Provider.of<ExecutiveChangeNotifier>(context, listen: false)
            .data!
            .tentCityId;
    Provider.of<RequestsListChangeNotifier>(context, listen: false)
        .get(tentCityId: tentCityId);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RequestsListChangeNotifier>(
        builder: (context, notifier, _) {
      if ((notifier.data == null || notifier.data!.isEmpty) &&
          notifier.state == AsyncChangeNotifierState.busy) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (notifier.data == null || notifier.data!.isEmpty) {
        return Center(child: Text('Sonuç Bulunamadı'));
      }
      return ListView.builder(
        itemBuilder: (context, index) => RequestCard(
          requestModel: notifier.data![index],
        ),
        itemCount: notifier.data!.length,
      );
    });
  }
}
