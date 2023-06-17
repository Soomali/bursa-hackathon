import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_tent_city_app/model/ProductModel.dart';
import 'package:smart_tent_city_app/model/inventory_model.dart';
import 'package:smart_tent_city_app/notifiers/async_change_notifier_state.dart';
import 'package:smart_tent_city_app/notifiers/cart_change_notifier/cart_change_notifier.dart';
import 'package:smart_tent_city_app/notifiers/executive_change_notifier/executive_change_notifier.dart';
import 'package:smart_tent_city_app/notifiers/inventory_change_notifier/inventory_change_notifier.dart';
import 'package:smart_tent_city_app/notifiers/victim_change_notifier.dart/victim_change_notifier.dart';
import 'package:smart_tent_city_app/pages/background_page.dart';
import 'package:smart_tent_city_app/pages/request/request_customer_page.dart';
import 'package:smart_tent_city_app/pages/request/request_page_type.dart';

class RequestPage extends StatelessWidget {
  final RequestPageType type;
  const RequestPage({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    final CartChangeNotifier cartNotifier = CartChangeNotifier();
    final tentCityId = type == RequestPageType.inventory
        ? Provider.of<ExecutiveChangeNotifier>(context, listen: false)
            .data!
            .tentCityId
        : Provider.of<VictimChangeNotifier>(context, listen: false)
            .data!
            .tentCityId;
    return Consumer<InventoryChangeNotifier>(builder: (context, notifier, _) {
      if (notifier.data == null) {
        if (notifier.state == AsyncChangeNotifierState.idle) {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            notifier.get(tentCityId);
          });
        }
        return BackgroundPage(
            child: Center(
          child: CircularProgressIndicator(),
        ));
      }
      return ChangeNotifierProvider.value(
        value: cartNotifier,
        child: BackgroundPage(
          child:
              RequestPageBody(productList: notifier.data!.products, type: type),
        ),
      );
    });
  }
}
