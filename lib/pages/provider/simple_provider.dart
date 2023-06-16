import 'package:flutter/cupertino.dart';
import 'package:smart_tent_city_app/pages/provider/data_change_notifier.dart';
import 'package:smart_tent_city_app/pages/provider/provider_state.dart';

abstract class SimpleProvider<T, V extends DataChangeNotifier> extends StatelessWidget {
  final Function( ProviderState<T>) buildWidget;

  const SimpleProvider({required this.buildWidget});

  @override
  Widget build(BuildContext context) {
      throw UnimplementedError();
  }
}
