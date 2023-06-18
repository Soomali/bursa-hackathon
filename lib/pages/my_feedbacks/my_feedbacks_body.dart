import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_tent_city_app/model/RequestStatus.dart';
import 'package:smart_tent_city_app/notifiers/async_change_notifier_state.dart';
import 'package:smart_tent_city_app/notifiers/pagination_change_notifier/feedback_list_change_notifier.dart';
import 'package:smart_tent_city_app/notifiers/pagination_change_notifier/requests_list_change_notifier.dart';
import 'package:smart_tent_city_app/notifiers/victim_change_notifier.dart/victim_change_notifier.dart';
import 'package:smart_tent_city_app/pages/executive/feedbacks/feedback_card.dart';
import 'package:smart_tent_city_app/pages/victim/my_requests/request_card.dart';

class MyFeedbacksBody extends StatefulWidget {
  const MyFeedbacksBody({super.key});

  @override
  State<MyFeedbacksBody> createState() => _MyFeedbacksBodyState();
}

class _MyFeedbacksBodyState extends State<MyFeedbacksBody> {
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
    Provider.of<FeedbackListChangeNotifier>(context, listen: false)
        .get(victimId: victimId);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FeedbackListChangeNotifier>(
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
        itemBuilder: (context, index) => FeedBackCard(
          feedBackModel: notifier.data![index],
        ),
        itemCount: notifier.data!.length,
      );
    });
  }
}
