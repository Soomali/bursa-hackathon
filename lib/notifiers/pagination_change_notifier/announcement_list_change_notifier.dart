import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smart_tent_city_app/constants/firebase.dart';
import 'package:smart_tent_city_app/model/announcement_model.dart';
import 'package:smart_tent_city_app/notifiers/pagination_change_notifier/pagination_change_notifier.dart';

class AnnouncementListChangeNotifier
    extends PaginationChangeNotier<AnnouncementModel> {
  final collection =
      FirebaseFirestore.instance.collection(announcementCollectionPath);

  Future<void> _get(String tentCityId) async {
    Query query =
        collection.where('tentCityId', isEqualTo: tentCityId).limit(10);
    query = paginate(query);
    final snapshot = await query.get();
    if (snapshot.docs.isEmpty) {
      return;
    }
    lastSnapshot = snapshot.docs.last;
    this.data = snapshot.docs
        .map((e) => e.data())
        .cast<Map<String, dynamic>>()
        .map(AnnouncementModel.fromJson)
        .toList();
  }

  void get(String tentCityId) => wrapAsync(() => _get(tentCityId),
      'get announcements error', 'get anouncements error');
}
