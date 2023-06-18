import 'package:smart_tent_city_app/notifiers/async_change_notifier.dart';

abstract class DataChangeNotifier<T> extends AsyncChangeNotifier{
  T? data;
}