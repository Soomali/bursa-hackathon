import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_tent_city_app/notifiers/executive_change_notifier/executive_change_notifier.dart';
import 'package:smart_tent_city_app/notifiers/pagination_change_notifier/feedback_list_change_notifier.dart';
import 'package:smart_tent_city_app/pages/background_page.dart';
import 'package:smart_tent_city_app/pages/executive/feedbacks/feedback_body.dart';

class FeedbackPage extends StatelessWidget {
  const FeedbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = FeedbackListChangeNotifier();
    final executive =
        Provider.of<ExecutiveChangeNotifier>(context, listen: false).data!;
    notifier.get(executive.tentCityId);
    return ChangeNotifierProvider.value(
      value: notifier,
      child: BackgroundPage(child: FeedbackBody()),
    );
  }
}
