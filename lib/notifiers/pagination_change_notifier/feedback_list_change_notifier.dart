import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_tent_city_app/constants/error_ids.dart';
import 'package:smart_tent_city_app/constants/error_messages.dart';
import 'package:smart_tent_city_app/constants/firebase.dart';
import 'package:smart_tent_city_app/model/FeedBackModel.dart';
import 'package:smart_tent_city_app/model/RequestModel.dart';
import 'package:smart_tent_city_app/notifiers/pagination_change_notifier/pagination_change_notifier.dart';

class FeedbackListChangeNotifier extends PaginationChangeNotier<FeedBackModel> {
  Future<void> _get({String? tentCityId, String? victimId}) async {
    final field = victimId != null ? 'victimId' : 'tentCityId';
    Query query = FirebaseFirestore.instance
        .collection(feedbackCollectionPath)
        .limit(10)
        .where(field, isEqualTo: tentCityId ?? victimId);
    if (tentCityId != null) {
      query = query.where('status', isEqualTo: 'notSeen');
    }
    query = paginate(query);
    final snapshot = await paginate(query).get();

    this.data = this.data = [
      ...(this.data ?? []),
      ...snapshot.docs
          .map((e) =>
              FeedBackModel.fromJson(e.data() as Map<String, dynamic>, e.id))
          .where((element) =>
              this.data == null ||
              this.data!.indexWhere((saved) => saved.id == element.id) == -1)
          .toList()
    ];
    notifyListeners();
    lastSnapshot = snapshot.docs.isNotEmpty ? snapshot.docs.last : null;
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
  void get({String? tentCityId, String? victimId}) {
    wrapAsync(() => _get(tentCityId: tentCityId, victimId: victimId),
        "getFeedback error", "get feedback error");
  }
}
