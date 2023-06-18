import 'package:flutter/material.dart';
import 'package:smart_tent_city_app/model/FeedBackModel.dart';
import 'package:smart_tent_city_app/model/RequestModel.dart';

class FeedBackCard extends StatelessWidget {
  final FeedBackModel feedBackModel;
  final VoidCallback? onTapAccept;
  const FeedBackCard({
    super.key,
    required this.feedBackModel,
    this.onTapAccept,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(12),
            child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(8)),
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * .02,
                    horizontal: MediaQuery.of(context).size.width * .05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${this.feedBackModel.tent_number} numaralı çadır tarafından iletildi',
                      style: TextStyle(fontSize: 12),
                    ),
                    Text(
                      feedBackModel.topic,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      feedBackModel.description,
                    )
                  ],
                )),
          ),
          Positioned(
            bottom: 0,
            right: 12,
            child: IconButton(
                onPressed: onTapAccept,
                icon: Icon(
                  Icons.check_circle_rounded,
                  color: Colors.redAccent.shade700,
                  size: 40,
                )),
          ),
        ],
      ),
    );
  }
}
