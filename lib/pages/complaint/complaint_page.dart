import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_tent_city_app/notifiers/async_change_notifier_state.dart';
import 'package:smart_tent_city_app/notifiers/feedback_change_notifier/feedback_change_notifier.dart';
import 'package:smart_tent_city_app/pages/background_page.dart';
import 'package:smart_tent_city_app/pages/complaint/complaint_body.dart';

class ComplaintPage extends StatelessWidget {
  const ComplaintPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FeedbackChangeNotifier(),
      child: BackgroundPage(
          child: Builder(
              builder: (context) => Consumer<FeedbackChangeNotifier>(
                      builder: (context, notifier, _) {
                    if (notifier.state == AsyncChangeNotifierState.done) {
                      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                        Navigator.of(context).pop();
                      });
                    }
                    if (notifier.state == AsyncChangeNotifierState.busy) {
                      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                        showDialog(
                            context: context,
                            builder: (context) => Center(
                                  child: CircularProgressIndicator(),
                                ));
                      });
                    }
                    return ComplaintBody();
                  }))),
    );
  }
}
