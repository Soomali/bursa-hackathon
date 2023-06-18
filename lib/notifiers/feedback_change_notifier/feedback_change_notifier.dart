import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_tent_city_app/constants/firebase.dart';
import 'package:smart_tent_city_app/model/FeedBackModel.dart';
import 'package:smart_tent_city_app/notifiers/data_change_notifier.dart';

class FeedbackChangeNotifier extends DataChangeNotifier<FeedBackModel> {
  final collection =
      FirebaseFirestore.instance.collection(feedbackCollectionPath);
  Future<void> _update(FeedBackModel feedBackModel) async {
    await collection.doc(feedBackModel.id).set(feedBackModel.toJson());
    this.data = feedBackModel;
    notifyListeners();
  }

  Future<void> _create(FeedBackModel feedBackModel) async {
    await _update(feedBackModel);
  }

  Future<void> _get(String id) async {
    final doc = await collection.doc(id).get();
    this.data = FeedBackModel.fromJson(doc.data() as Map<String, dynamic>, id);
    notifyListeners();
  }

  void get(String id) => wrapAsync(() => _get(id), "getfbcj", "MESSAGE");
  void create(FeedBackModel model) =>
      wrapAsync(() => _create(model), "crfeed", "aaa message");
  void update(FeedBackModel model) =>
      wrapAsync(() => _update(model), 'updafeedbak', 'message');
}
