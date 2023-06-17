import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_tent_city_app/model/FeedBackModel.dart';
import 'package:smart_tent_city_app/notifiers/async_change_notifier_state.dart';
import 'package:smart_tent_city_app/notifiers/executive_change_notifier/executive_change_notifier.dart';
import 'package:smart_tent_city_app/notifiers/feedback_change_notifier/feedback_change_notifier.dart';
import 'package:smart_tent_city_app/notifiers/pagination_change_notifier/feedback_list_change_notifier.dart';
import 'package:smart_tent_city_app/pages/feedbacks/feedback_card.dart';

class FeedbackBody extends StatefulWidget {
  const FeedbackBody({super.key});

  @override
  State<FeedbackBody> createState() => _FeedbackBodyState();
}

class _FeedbackBodyState extends State<FeedbackBody> {
  final ScrollController _controller = ScrollController();
  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.position.maxScrollExtent == _controller.offset) {
        final feedbackNotifier =
            Provider.of<FeedbackListChangeNotifier>(context, listen: false);
        if (feedbackNotifier.state == AsyncChangeNotifierState.busy) {
          return;
        }
        final executive =
            Provider.of<ExecutiveChangeNotifier>(context, listen: false).data!;
        feedbackNotifier.get(executive.tentCityId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FeedbackListChangeNotifier>(
      builder: (context, notifier, _) {
        if (notifier.state == AsyncChangeNotifierState.busy &&
            (notifier.data == null || notifier.data!.isEmpty)) {
          return CircularProgressIndicator();
        }
        if (notifier.data == null) {
          return Center(
            child: Text('Hiç istek veeya şikayet yok.'),
          );
        }
        return ListView.builder(
          controller: _controller,
          itemBuilder: (context, index) =>
              FeedbackCard(feedBackModel: notifier.data![index]),
          itemCount: notifier.data!.length,
        );
      },
    );
  }
}
