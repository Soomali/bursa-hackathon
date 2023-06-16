import 'package:flutter/cupertino.dart';
import 'package:smart_tent_city/notifiers/async_change_notifier_state.dart';

abstract class AsyncChangeNotifier extends ChangeNotifier {
  AsyncChangeNotifierState state = AsyncChangeNotifierState.idle;
}
