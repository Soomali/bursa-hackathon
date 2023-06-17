import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_tent_city_app/constants/error_ids.dart';
import 'package:smart_tent_city_app/constants/error_messages.dart';
import 'package:smart_tent_city_app/constants/firebase.dart';
import 'package:smart_tent_city_app/model/RequestModel.dart';
import 'package:smart_tent_city_app/notifiers/pagination_change_notifier/pagination_change_notifier.dart';

class RequestsListChangeNotifier extends PaginationChangeNotier {
  Future<void> _get(String? tentCityId) async {
    final query = FirebaseFirestore.instance
        .collection(requestCollectionPath)
        .limit(10)
        .where('tentCityId', isEqualTo: tentCityId);

    final snapshot = await paginate(query).get();
    final newData = snapshot.docs
        .map((e) =>
            RequestModel.fromJson(e.data() as Map<String, dynamic>, e.id))
        .toList();
    this.data = [...(this.data ?? []), ...newData];
    notifyListeners();
  }

  void get(String tentCityId) {
    wrapAsync(
        () => _get(tentCityId), "getFeedback error", "get feedback error");
  }
}
