import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_tent_city_app/constants/error_ids.dart';
import 'package:smart_tent_city_app/constants/error_messages.dart';
import 'package:smart_tent_city_app/constants/firebase.dart';
import 'package:smart_tent_city_app/model/ExecutiveModel.dart';
import 'package:smart_tent_city_app/model/tentModel.dart';
import 'package:smart_tent_city_app/notifiers/async_change_notifier.dart';
import 'package:smart_tent_city_app/pages/provider/data_change_notifier.dart';

class TentChangeNotifier extends DataChangeNotifier<TentModel> {
  final collection = FirebaseFirestore.instance.collection(tentCollectionPath);
  Future<void> _get(String id) async {
    final doc = await collection.doc(id).get();
    this.data = TentModel.fromJson(doc.data() as Map<String, dynamic>, id);
    notifyListeners();
  }

  Future<void> _update(TentModel tentModel) async {
    collection.doc(tentModel.id).update(tentModel.toJson());
  }

  void get(String id) => wrapAsync(() => _get(id),
      ErrorIdConstants.tentGetErrorId, ErrorMessageConstants.tentGetError);
}
