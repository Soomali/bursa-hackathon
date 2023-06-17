import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_tent_city_app/constants/error_ids.dart';
import 'package:smart_tent_city_app/constants/error_messages.dart';
import 'package:smart_tent_city_app/constants/firebase.dart';
import 'package:smart_tent_city_app/model/VictimModel.dart';
import 'package:smart_tent_city_app/pages/provider/data_change_notifier.dart';

class VictimChangeNotifier extends DataChangeNotifier<VictimModel> {
  final victimCollection =
      FirebaseFirestore.instance.collection(victimCollectionPath);
  Future<void> _get(String id) async {
    final doc = await victimCollection.doc(id).get();
    this.data =
        VictimModel.fromJson(doc.data() as Map<String, dynamic>, doc.id);
    notifyListeners();
  }

  Future<void> _create(VictimModel victimModel) async {
    await victimCollection.doc(victimModel.id).set(victimModel.toJson());
  }

  Future<void> _delete(
      String name, String surname, String tentNumber, String tentCityId) async {
    final snapshot = await victimCollection
        .where('name', isEqualTo: name)
        .where('surname', isEqualTo: surname)
        .where('tentNumber', isEqualTo: tentNumber)
        .where('tentCityId', isEqualTo: tentCityId)
        .get();
    if (snapshot.docs.length != 1) {
      throw Exception();
    }
    await victimCollection.doc(snapshot.docs.first.id).delete();
  }

  void create(VictimModel victimModel) => wrapAsync(
      () => _create(victimModel),
      ErrorIdConstants.victimPostErrorId,
      ErrorMessageConstants.victimPostError);
  void delete(
          String name, String surname, String tentNumber, String tentCityId) =>
      wrapAsync(
          () => _delete(name, surname, tentNumber, tentCityId),
          ErrorIdConstants.victimDeleteErrorId,
          ErrorMessageConstants.victimDeleteError);
  void get(String id) => wrapAsync(() => _get(id),
      ErrorIdConstants.victimGetErrorId, ErrorMessageConstants.victimGetError);
}
