import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_tent_city_app/model/ProductModel.dart';
import 'package:smart_tent_city_app/model/inventory_model.dart';
import 'package:smart_tent_city_app/notifiers/async_change_notifier_state.dart';
import 'package:smart_tent_city_app/notifiers/cart_change_notifier/cart_change_notifier.dart';
import 'package:smart_tent_city_app/notifiers/executive_change_notifier/executive_change_notifier.dart';
import 'package:smart_tent_city_app/notifiers/inventory_change_notifier/inventory_change_notifier.dart';
import 'package:smart_tent_city_app/notifiers/request_change_notifier/request_change_notifier.dart';
import 'package:smart_tent_city_app/notifiers/victim_change_notifier.dart/victim_change_notifier.dart';
import 'package:smart_tent_city_app/pages/background_page.dart';
import 'package:smart_tent_city_app/pages/request/request_customer_page.dart';
import 'package:smart_tent_city_app/pages/request/request_page_type.dart';

class RequestPage extends StatelessWidget {
  final RequestPageType type;
  final CartChangeNotifier cartNotifier;
  RequestPage({super.key, required this.type, CartChangeNotifier? notifier})
      : cartNotifier = notifier ?? CartChangeNotifier();

  @override
  Widget build(BuildContext context) {
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
      return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: cartNotifier,
          ),
          ChangeNotifierProvider.value(
            value: RequestChangeNotifier(),
          ),
        ],
        child: BackgroundPage(
          fab: type == RequestPageType.search
              ? Builder(builder: (context) {
                  return Consumer<CartChangeNotifier>(
                      builder: (context, notifier, child) {
                        return GestureDetector(
                          onTap: notifier.cart.isEmpty
                              ? null
                              : () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => RequestPage(
                                          notifier: notifier,
                                          type: RequestPageType.submit)));
                                },
                          child: Stack(
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
                                      border:
                                          Border.all(color: Colors.redAccent),
                                      color: Colors.white,
                                    ),
                                    child: Text(
                                      notifier.cart
                                          .map((e) => e.amount)
                                          .reduce((value, element) =>
                                              value + element)
                                          .toString(),
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.redAccent.shade700),
                                    ),
                                  ),
                                )
                            ],
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: Colors.redAccent.shade700),
                              color: Colors.redAccent.shade700,
                            ),
                            child: Icon(
                              Icons.shopping_bag_outlined,
                              size: 48,
                              color: Colors.white,
                            )),
                      ));
                })
              : null,
          child:
              RequestPageBody(productList: notifier.data!.products, type: type),
        ),
      );
    });
  }
}
