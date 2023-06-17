import 'package:flutter/cupertino.dart';
import 'package:smart_tent_city_app/notifiers/async_change_notifier_state.dart';

import '../model/error_model.dart';

abstract class AsyncChangeNotifier extends ChangeNotifier {
  AsyncChangeNotifierState _state = AsyncChangeNotifierState.idle;
  AsyncChangeNotifierState get state => _state;
  void set state(AsyncChangeNotifierState newState) {
    _stateBefore = _state;
    _state = newState;
  }

  bool get stateChanged {
    return _stateBefore != _state;
  }

  AsyncChangeNotifierState _stateBefore = AsyncChangeNotifierState.idle;
  AsyncChangeNotifierState get stateBefore => _stateBefore;
  @protected
  List<ErrorModel> errors = [];

  @protected
  void addError(ErrorModel error) {
    errors.add(error);
  }

  @protected
  void wrap(Function() wrapee, ErrorModel error) {
    try {
      wrapee();
    } catch (e) {
      addError(error);
      notifyListeners();
    }
  }

  ErrorModel? getError(String id) {
    for (int i = 0; i < errors.length; i++) {
      if (errors[i].id == id) {
        return errors[i];
      }
    }
    return null;
  }

  void removeError(String id) {
    for (int i = 0; i < errors.length; i++) {
      if (errors[i].id == id) {
        errors.removeAt(i);
      }
    }
  }

  Future<void> wrapAsync(
      Future Function() wrapee, String id, String message) async {
    try {
      state = AsyncChangeNotifierState.busy;
      notifyListeners();
      await wrapee();
      state = AsyncChangeNotifierState.done;
    } catch (e) {
      print(id);
      print(e);
      addError(ErrorModel(id, message));
      state = AsyncChangeNotifierState.idle;
    }
    notifyListeners();
  }
}
