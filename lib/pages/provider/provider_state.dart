import 'package:smart_tent_city_app/notifiers/async_change_notifier.dart';

import '../../model/error_model.dart';

class ProviderState<T>{
  List<ErrorModel> errors;
  AsyncChangeNotifier state;
  T? data;

  ProviderState({
    required this.errors,
    required this.state,
    this.data,
  });
}