import 'package:smart_tent_city_app/notifiers/async_change_notifier.dart';

import '../../model/error_model.dart';
import '../../notifiers/async_change_notifier_state.dart';

class ProviderState<T> {
  List<ErrorModel> errors = [];
  AsyncChangeNotifierState state;
  T? data;

  ProviderState({
    required this.state,
    this.data,
  });
}
