import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_tent_city_app/constants/error_ids.dart';
import 'package:smart_tent_city_app/constants/error_messages.dart';
import 'package:smart_tent_city_app/constants/firebase.dart';
import 'package:smart_tent_city_app/model/VictimModel.dart';
import 'package:smart_tent_city_app/model/movement_model.dart';
import 'package:smart_tent_city_app/notifiers/async_change_notifier_state.dart';
import 'package:smart_tent_city_app/notifiers/data_change_notifier.dart';

class VictimChangeNotifier extends DataChangeNotifier<VictimModel> {
  final victimCollection =
      FirebaseFirestore.instance.collection(victimCollectionPath);
  CollectionReference getMovementCollection(String victimId) =>
      victimCollection.doc(victimId).collection(movementCollectionPath);
  Future<void> _get(String id) async {
    final doc = await victimCollection.doc(id).get();
    this.data =
        VictimModel.fromJson(doc.data() as Map<String, dynamic>, doc.id);
    notifyListeners();
  }

  Future<void> _getMovements(String id) async {
    if (this.data?.id != id) {
      await _get(id);
    }
    final movementCollection = getMovementCollection(id);
    final snapshots = await movementCollection.get();
    this.data!.movements = snapshots.docs
        .map((e) => e.data())
        .cast<Map<String, dynamic>>()
        .map(MovementModel.fromJson)
        .toList();
  }

  Future<void> _addMovement(String id, MovementModel movementModel) async {
    final movementCollection = getMovementCollection(id);
    await movementCollection.add(movementModel.toJson());
  }

  Future<void> _create(VictimModel victimModel) async {
    await victimCollection.doc(victimModel.id).set(victimModel.toJson());
  }

  Future<void> _getByPhoneNumber(String phoneNumber) async {
    final snapshot = await victimCollection
        .where('phoneNumber', isEqualTo: phoneNumber)
        .get();
    final doc = snapshot.docs.first;
    this.data =
        VictimModel.fromJson(doc.data() as Map<String, dynamic>, doc.id);
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

  void addMovement(String id, MovementModel movementModel) => wrapAsync(
      () => _addMovement(id, movementModel),
      'addMovementID',
      'add Movement error');
  void getMovements(String id) => wrapAsync(
      () => _getMovements(id), 'get movements error Id', 'get movements error');

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
  void get({String? id, String? phoneNumber}) => wrapAsync(
      () => id != null ? _get(id) : _getByPhoneNumber(phoneNumber!),
      ErrorIdConstants.victimGetErrorId,
      ErrorMessageConstants.victimGetError);
}
