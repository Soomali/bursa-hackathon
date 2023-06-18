import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_tent_city_app/constants/firebase.dart';
import 'package:smart_tent_city_app/model/FeedBackModel.dart';
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .2,
            ),
            Text(
              'lütfen görevlilerimizin elinden geleni yaptığını istek ve şikayetinizi iletirken dikkate alınız',
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: 'Konu', border: OutlineInputBorder()),
              onChanged: (val) {
                setState(() {
                  topic = val;
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              maxLines: null,
              decoration: InputDecoration(
                  hintText: 'Detay', border: OutlineInputBorder()),
              onChanged: (val) {
                setState(() {
                  topic = val;
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            ComplaintButton(onPressed: () {
              final victimModel =
                  Provider.of<VictimChangeNotifier>(context, listen: false)
                      .data!;
              final FeedBackModel model = FeedBackModel(
                  tent_number: victimModel.tent_number,
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
        ),
      ),
    );
  }
}
