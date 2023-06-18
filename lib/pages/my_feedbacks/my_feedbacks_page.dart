import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_tent_city_app/model/user_type.dart';
import 'package:smart_tent_city_app/notifiers/pagination_change_notifier/feedback_list_change_notifier.dart';
import 'package:smart_tent_city_app/notifiers/victim_change_notifier.dart/victim_change_notifier.dart';
import 'package:smart_tent_city_app/pages/background_page.dart';
import 'package:smart_tent_city_app/pages/my_feedbacks/my_feedbacks_body.dart';
import 'package:smart_tent_city_app/pages/request/request_page.dart';

class MyFeedbacksPage extends StatelessWidget {
  const MyFeedbacksPage({super.key});

  @override
  Widget build(BuildContext context) {
    final feedbackNotifier = FeedbackListChangeNotifier();
    return UserDataProviderWidget(
      userType: UserType.victim,
      child: Builder(builder: (context) {
        return Consumer<VictimChangeNotifier>(builder: (context, notifier, _) {
          if (notifier.data == null) {
            return Center(child: CircularProgressIndicator());
          }
          final victimId = notifier.data!.id;
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            feedbackNotifier.get(victimId: victimId);
          });
          return ChangeNotifierProvider.value(
              value: feedbackNotifier,
              child: BackgroundPage(child: MyFeedbacksBody()));
        });
      }),
    );
  }
}
