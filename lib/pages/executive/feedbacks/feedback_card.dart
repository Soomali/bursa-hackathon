import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_tent_city_app/constants/custom_colors.dart';
import 'package:smart_tent_city_app/model/FeedBackModel.dart';
import 'package:smart_tent_city_app/model/RequestModel.dart';
import 'package:smart_tent_city_app/model/user_type.dart';
import 'package:smart_tent_city_app/notifiers/user_type_change_notifier/user_type_change_notifier.dart';
import 'package:smart_tent_city_app/util/utils.dart';

class FeedBackCard extends StatelessWidget {
  final FeedBackModel feedBackModel;
  final VoidCallback? onTapAccept;
  const FeedBackCard({
    super.key,
    required this.feedBackModel,
    this.onTapAccept,
  });

  Widget getStatusChip() {
    String label = '';
    Color color;
    Color textColor;
    switch (feedBackModel.status) {
      case FeedbackStatus.seen:
        label = 'Dikkate Alındı';
        color = CustomColors.greenAccent;
        textColor = Colors.white;
        break;
      case FeedbackStatus.notSeen:
        label = 'Henüz Görülmedi';
        color = Colors.yellow;
        textColor = Colors.black;
        break;
    }
    return Chip(
        labelPadding: EdgeInsets.fromLTRB(2, 0, 2, 0),
        backgroundColor: color,
        label: Text(
          label,
          style: TextStyle(color: textColor, fontSize: 12),
        ));
  }

  @override
  Widget build(BuildContext context) {
    final UserType userType =
        Provider.of<UserTypeChangeNotifier>(context, listen: false).userType ??
            UserType.victim;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(8)),
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * .03,
                    horizontal: MediaQuery.of(context).size.width * .05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (userType == UserType.executive)
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
            child: getStatusChip(),
            left: 0,
            top: -5,
          ),
          Positioned(
            child: Text(
              getDateString(
                this.feedBackModel.date.toDate(),
              ),
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12),
            ),
            right: 28,
            top: 28,
          ),
          if (userType != UserType.victim)
            Positioned(
              bottom: 6,
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
