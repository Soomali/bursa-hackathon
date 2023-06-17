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
          fab: Builder(builder: (context) {
            return Consumer<CartChangeNotifier>(
                builder: (context, notifier, child) {
                  return Stack(
                    children: [
                      Positioned(
                        child: child!,
                      ),
                      if (notifier.cart.isNotEmpty)
                        Positioned(
                          top: 12,
                          left: 8,
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.redAccent),
                              color: Colors.white,
                            ),
                            child: Text(
                              notifier.cart
                                  .map((e) => e.amount)
                                  .reduce((value, element) => value + element)
                                  .toString(),
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.redAccent.shade700),
                            ),
                          ),
                        )
                    ],
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.redAccent.shade700),
                        color: Colors.redAccent.shade700,
                      ),
                      child: Icon(
                        Icons.shopping_bag_outlined,
                        size: 48,
                        color: Colors.white,
                      )),
                ));
          }),
          child:
              RequestPageBody(productList: notifier.data!.products, type: type),
        ),
      );
    });
  }
}
