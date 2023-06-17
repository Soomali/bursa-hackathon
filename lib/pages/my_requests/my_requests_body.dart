import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_tent_city_app/notifiers/async_change_notifier_state.dart';
import 'package:smart_tent_city_app/notifiers/pagination_change_notifier/requests_list_change_notifier.dart';
import 'package:smart_tent_city_app/notifiers/victim_change_notifier.dart/victim_change_notifier.dart';
import 'package:smart_tent_city_app/pages/my_requests/request_card.dart';

class MyRequestsBody extends StatefulWidget {
  const MyRequestsBody({super.key});

  @override
  State<MyRequestsBody> createState() => _MyRequestsBodyState();
}

class _MyRequestsBodyState extends State<MyRequestsBody> {
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
    final victimId =
        Provider.of<VictimChangeNotifier>(context, listen: false).data!.id;
    Provider.of<RequestsListChangeNotifier>(context, listen: false)
        .get(victimId: victimId);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RequestsListChangeNotifier>(
        builder: (context, notifier, _) {
      if (notifier.data != null &&
          notifier.data!.isEmpty &&
          notifier.state == AsyncChangeNotifierState.busy) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (notifier.data == null || notifier.data!.isEmpty) {
        return Center(child: Text('Sonuç Bulunamadı'));
      }
      return Expanded(
          child: ListView.builder(
        itemBuilder: (context, index) => RequestCard(
          requestModel: notifier.data![index],
        ),
        itemCount: notifier.data!.length,
      ));
    });
  }
}
