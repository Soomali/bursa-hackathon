import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_tent_city_app/constants/error_ids.dart';
import 'package:smart_tent_city_app/constants/error_messages.dart';
import 'package:smart_tent_city_app/constants/firebase.dart';
import 'package:smart_tent_city_app/model/RequestModel.dart';
import 'package:smart_tent_city_app/notifiers/pagination_change_notifier/pagination_change_notifier.dart';

class RequestsListChangeNotifier extends PaginationChangeNotier<RequestModel> {
  Future<void> _get({String? victimId, String? tentCityId}) async {
    final field = victimId != null ? 'victimId' : 'tentCityId';
    var query = FirebaseFirestore.instance
        .collection(requestCollectionPath)
        .limit(10)
        .where(field, isEqualTo: victimId ?? tentCityId);
    if (tentCityId != null) {
      query = query.where('status', isEqualTo: 'waiting');
    }

    final snapshot = await paginate(query).get();
    lastSnapshot = snapshot.docs.last;
    final newData = snapshot.docs
        .map((e) =>
            RequestModel.fromJson(e.data() as Map<String, dynamic>, e.id))
        .toList();
    this.data = [...(this.data ?? []), ...newData];
    notifyListeners();
  }

  Future<void> _handleUpdate(RequestModel requestModel, int index) async {
    this.data?.removeAt(index);
    notifyListeners();
    await FirebaseFirestore.instance
        .collection(requestCollectionPath)
        .doc(requestModel.id)
        .update(requestModel.toJson());
  }

  void update(RequestModel requestModel, int index) => wrapAsync(
      () => _handleUpdate(requestModel, index),
      'updateRequestListId',
      'updateRequestId');

  void get({String? victimId, String? tentCityId}) {
    assert(victimId != null || tentCityId != null,
        'tentId or victimId has to be given');
    wrapAsync(
        () => _get(victimId: victimId, tentCityId: tentCityId),
        ErrorIdConstants.requestsGetErrorId,
        ErrorMessageConstants.requestsGetError);
  }
}
