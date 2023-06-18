import 'package:flutter/material.dart';
import 'package:smart_tent_city_app/model/announcement_model.dart';
import 'package:smart_tent_city_app/util/utils.dart';

class AnnouncementCard extends StatelessWidget {
  final AnnouncementModel model;
  const AnnouncementCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.redAccent.shade700)),
        // borderRadius: BorderRadius.circular(4)
      ),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  flex: 4,
                  child: Text(
                    model.title,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  )),
              Expanded(
                flex: 1,
                child: Text(
                  getDateString(model.date.toDate()),
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w200),
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            model.description,
            style: TextStyle(fontSize: 14),
          )
        ],
      ),
    );
  }
}
