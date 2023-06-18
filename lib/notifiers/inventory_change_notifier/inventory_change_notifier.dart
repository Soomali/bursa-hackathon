import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_tent_city_app/constants/error_ids.dart';
import 'package:smart_tent_city_app/constants/error_messages.dart';
import 'package:smart_tent_city_app/constants/firebase.dart';
import 'package:smart_tent_city_app/model/inventory_model.dart';
import 'package:smart_tent_city_app/notifiers/data_change_notifier.dart';

class InventoryChangeNotifier extends DataChangeNotifier<InventoryModel> {
  final collection =
      FirebaseFirestore.instance.collection(inventoryCollectionPath);
  Future<void> _get(String tentCityId) async {
    final doc =
        await collection.where('tentCityId', isEqualTo: tentCityId).get();
    final first = doc.docs.first;
    this.data = InventoryModel.fromJson(first.data(), first.id);
  }

  Future<void> _update(InventoryModel inventoryModel) async {
    await collection.doc(inventoryModel.id).set(inventoryModel.toJson());
    this.data = inventoryModel;
  }

  void get(String tentCityId) => wrapAsync(
      () => _get(tentCityId),
      ErrorIdConstants.inventoryGetErrorId,
      ErrorMessageConstants.inventoryGetError);
  void update(InventoryModel inventoryModel) => wrapAsync(
      () => _update(inventoryModel),
      ErrorIdConstants.inventoryGetErrorId,
      ErrorMessageConstants.inventoryUpdateError);
}
