import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_tent_city_app/constants/error_ids.dart';
import 'package:smart_tent_city_app/constants/error_messages.dart';
import 'package:smart_tent_city_app/constants/firebase.dart';
import 'package:smart_tent_city_app/model/RequestModel.dart';
import 'package:smart_tent_city_app/notifiers/data_change_notifier.dart';

class RequestChangeNotifier extends DataChangeNotifier<RequestModel> {
  final collection =
      FirebaseFirestore.instance.collection(requestCollectionPath);
  Future<void> _get(String requestId) async {
    final response = await collection.doc(requestId).get();
    this.data = RequestModel.fromJson(
        response.data() as Map<String, dynamic>, response.id);
    notifyListeners();
  }

  Future<void> _update(RequestModel requestModel) async {
    await collection.doc(requestModel.id).set(requestModel.toJson());
    this.data = requestModel;
    notifyListeners();
  }

  void get(String requestId) => wrapAsync(
      () => _get(requestId),
      ErrorIdConstants.requestsGetErrorId,
      ErrorMessageConstants.requestsGetError);
  void update(RequestModel requestModel) => wrapAsync(
      () => _update(requestModel),
      ErrorIdConstants.requestsGetErrorId,
      ErrorMessageConstants.requestsUpdateError);
}
