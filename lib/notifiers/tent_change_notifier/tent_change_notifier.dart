import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_tent_city_app/constants/error_ids.dart';
import 'package:smart_tent_city_app/constants/error_messages.dart';
import 'package:smart_tent_city_app/constants/firebase.dart';
import 'package:smart_tent_city_app/model/ExecutiveModel.dart';
import 'package:smart_tent_city_app/model/error_wrapper.dart';
import 'package:smart_tent_city_app/model/tentModel.dart';
import 'package:smart_tent_city_app/notifiers/async_change_notifier.dart';
import 'package:smart_tent_city_app/pages/provider/data_change_notifier.dart';

class TentChangeNotifier extends DataChangeNotifier<TentModel>
    with ErrorWrapper {
  Future<void> _get(String id) async {
    final doc = await FirebaseFirestore.instance
        .collection(tentCollectionPath)
        .doc(id)
        .get();
    this.data = TentModel.fromJson(doc.data() as Map<String, dynamic>);
    notifyListeners();
  }

  void get(String id) => wrapAsync(() => _get(id),
      ErrorIdConstants.tentGetErrorId, ErrorMessageConstants.tentGetError);
}
