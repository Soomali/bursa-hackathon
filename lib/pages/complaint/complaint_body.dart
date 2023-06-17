import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_tent_city_app/constants/firebase.dart';
import 'package:smart_tent_city_app/model/FeedBackModel.dart';
import 'package:smart_tent_city_app/model/VictimModel.dart';
import 'package:smart_tent_city_app/notifiers/feedback_change_notifier/feedback_change_notifier.dart';
import 'package:smart_tent_city_app/notifiers/victim_change_notifier.dart/victim_change_notifier.dart';
import 'package:smart_tent_city_app/pages/complaint/complaint_button.dart';

class ComplaintBody extends StatefulWidget {
  const ComplaintBody({super.key});

  @override
  State<ComplaintBody> createState() => _ComplaintBodyState();
}

class _ComplaintBodyState extends State<ComplaintBody> {
  String topic = '';
  String description = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '*lütfen görevlilerimizin elinden geldiğini yaptığını istek ve şikayetinizi iletirken dikkate alınız*',
          textAlign: TextAlign.center,
        ),
        TextField(
          onChanged: (val) {
            setState(() {
              topic = val;
            });
          },
        ),
        TextField(
          onChanged: (val) {
            setState(() {
              description = val;
            });
          },
        ),
        ComplaintButton(onPressed: () {
          final victimModel =
              Provider.of<VictimChangeNotifier>(context, listen: false).data!;
          final FeedBackModel model = FeedBackModel(
              topic: topic,
              victimId: victimModel.id,
              tentCityId: victimModel.tentCityId,
              id: FirebaseFirestore.instance
                  .collection(feedbackCollectionPath)
                  .doc()
                  .id,
              status: FeedbackStatus.notSeen,
              description: description);
          Provider.of<FeedbackChangeNotifier>(context, listen: false)
              .create(model);
        })
      ],
    );
  }
}
