import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_tent_city_app/constants/error_ids.dart';
import 'package:smart_tent_city_app/constants/error_messages.dart';
import 'package:smart_tent_city_app/constants/firebase.dart';
import 'package:smart_tent_city_app/model/RequestModel.dart';
import 'package:smart_tent_city_app/model/VictimModel.dart';
import 'package:smart_tent_city_app/notifiers/async_change_notifier_state.dart';
import 'package:smart_tent_city_app/notifiers/pagination_change_notifier/pagination_change_notifier.dart';

class VictimListChangeNotifier extends PaginationChangeNotier<VictimModel> {
  final collection =
      FirebaseFirestore.instance.collection(victimCollectionPath);
  String lastQuery = '';
  Future<void> _get({String? fullName, String? phoneNumber}) async {
    Query query;
    if (phoneNumber != null) {
      query = collection.where('phoneNumber', isEqualTo: phoneNumber);
      if (lastQuery == phoneNumber) {
        query = paginate(query);
      } else {
        this.data = [];
        notifyListeners();
      }
      lastQuery = phoneNumber;
    } else {
      final nameList = fullName!.split(' ');
      final surname = nameList.removeAt(nameList.length - 1);
      query = collection
          .where('name', isEqualTo: nameList.join(' '))
          .where('surname', isEqualTo: surname);
      if (lastQuery == fullName) {
        query = paginate(query);
        this.data = [];
        notifyListeners();
      }
      lastQuery = fullName;
    }
    final snapshot = await query.get();
    final newData = snapshot.docs
        .map(
            (e) => VictimModel.fromJson(e.data() as Map<String, dynamic>, e.id))
        .toList();
    this.data = [...(this.data ?? []), ...newData];
    notifyListeners();
  }

  void get({String? fullName, String? phoneNumber}) {
    assert(fullName != null || phoneNumber != null,
        'tentId or victimId has to be given');
    wrapAsync(
        () => _get(fullName: fullName, phoneNumber: phoneNumber),
        ErrorIdConstants.requestsGetErrorId,
        ErrorMessageConstants.requestsGetError);
  }
}
