import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:smart_tent_city_app/model/error_wrapper.dart';
import 'package:smart_tent_city_app/pages/provider/data_change_notifier.dart';

class PaginationChangeNotier<T> extends DataChangeNotifier<List<T>>
    with ErrorWrapper {
  DocumentSnapshot? lastSnapshot;
  @protected
  Query<Object?> paginate(Query query) {
    if (this.lastSnapshot == null) {
      return query;
    }
    return query.startAfter([lastSnapshot]);
  }
}
