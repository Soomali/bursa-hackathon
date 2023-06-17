import 'package:flutter/material.dart';
import 'package:smart_tent_city_app/model/FeedBackModel.dart';

class FeedbackCard extends StatelessWidget {
  final FeedBackModel feedBackModel;
  const FeedbackCard({super.key, required this.feedBackModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.redAccent.shade700),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
        child: Column(
          children: [
            Text('Konu:${feedBackModel.topic}'),
            SizedBox(
              height: 20,
            ),
            Text('Açıklama:${feedBackModel.description}')
          ],
        ),
      ),
    );
  }
}
