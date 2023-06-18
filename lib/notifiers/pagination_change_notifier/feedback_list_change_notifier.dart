import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_tent_city_app/constants/error_ids.dart';
import 'package:smart_tent_city_app/constants/error_messages.dart';
import 'package:smart_tent_city_app/constants/firebase.dart';
import 'package:smart_tent_city_app/model/FeedBackModel.dart';
import 'package:smart_tent_city_app/model/RequestModel.dart';
import 'package:smart_tent_city_app/notifiers/pagination_change_notifier/pagination_change_notifier.dart';

class FeedbackListChangeNotifier extends PaginationChangeNotier {
  Future<void> _get(String? tentCityId) async {
    final query = FirebaseFirestore.instance
        .collection(feedbackCollectionPath)
        .limit(10)
        .where('tentCityId', isEqualTo: tentCityId)
        .where('status', isEqualTo: 'notSeen');

    final snapshot = await paginate(query).get();
    final newData = snapshot.docs
        .map((e) =>
            FeedBackModel.fromJson(e.data() as Map<String, dynamic>, e.id))
        .toList();
    this.data = [...(this.data ?? []), ...newData];
    notifyListeners();
  }

  Future<void> _resolve(FeedBackModel feedBackModel) async {
    int? index =
        this.data?.indexWhere((element) => element.id == feedBackModel.id);
    if (index != null && index != -1) {
      this.data!.removeAt(index);
      notifyListeners();
    }
    feedBackModel.status = FeedbackStatus.seen;
    await FirebaseFirestore.instance
        .collection(feedbackCollectionPath)
        .doc(feedBackModel.id)
        .set(feedBackModel.toJson());
  }

  void resolve(FeedBackModel feedBackModel) => wrapAsync(
      () => _resolve(feedBackModel),
      'resolve feedback error ',
      'resolve feedback error message');
  void get(String tentCityId) {
    wrapAsync(
        () => _get(tentCityId), "getFeedback error", "get feedback error");
  }
}
