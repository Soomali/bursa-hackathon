import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:smart_tent_city_app/notifiers/async_change_notifier.dart';
import 'package:smart_tent_city_app/pages/provider/data_change_notifier.dart';
import 'package:smart_tent_city_app/pages/provider/provider_state.dart';

abstract class SimpleProvider<T, V extends DataChangeNotifier> extends StatelessWidget {
  final Function(BuildContext, ProviderState<T>) buildWidget;
  const SimpleProvider({required this.buildWidget});

  @override
  Widget build(BuildContext context) {
    return Consumer<V>(
      builder: (context, notifier, _) {
        final state = ProviderState<T>(state:notifier.state,data: notifier.data,);
        return buildWidget(context,state);
      },
    );
  }
}
