import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_tent_city_app/constants/error_ids.dart';
import 'package:smart_tent_city_app/constants/error_messages.dart';
import 'package:smart_tent_city_app/constants/firebase.dart';
import 'package:smart_tent_city_app/model/RequestModel.dart';
import 'package:smart_tent_city_app/notifiers/pagination_change_notifier/pagination_change_notifier.dart';

class RequestsListChangeNotifier extends PaginationChangeNotier {
  Future<void> _get({String? victimId, String? tentId}) async {
    final field = victimId != null ? 'victimId' : 'tentId';
    final query = FirebaseFirestore.instance
        .collection(requestCollectionPath)
        .limit(10)
        .where(field, isEqualTo: victimId ?? tentId);

    final snapshot = await paginate(query).get();
    final newData = snapshot.docs
        .map((e) =>
            RequestModel.fromJson(e.data() as Map<String, dynamic>, e.id))
        .toList();
    this.data = [...(this.data ?? []), ...newData];
    notifyListeners();
  }

  void get({String? victimId, String? tentId}) {
    assert(victimId != null || tentId != null,
        'tentId or victimId has to be given');
    wrapAsync(
        () => _get(victimId: victimId, tentId: tentId),
        ErrorIdConstants.requestsGetErrorId,
        ErrorMessageConstants.requestsGetError);
  }
}
