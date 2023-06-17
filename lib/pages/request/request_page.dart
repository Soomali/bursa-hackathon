import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_tent_city_app/constants/custom_colors.dart';
import 'package:smart_tent_city_app/model/ProductModel.dart';
import 'package:smart_tent_city_app/model/inventory_model.dart';
import 'package:smart_tent_city_app/model/user_type.dart';
import 'package:smart_tent_city_app/notifiers/async_change_notifier_state.dart';
import 'package:smart_tent_city_app/notifiers/auth/executive_auth_change_notifier.dart';
import 'package:smart_tent_city_app/notifiers/cart_change_notifier/cart_change_notifier.dart';
import 'package:smart_tent_city_app/notifiers/executive_change_notifier/executive_change_notifier.dart';
import 'package:smart_tent_city_app/notifiers/inventory_change_notifier/inventory_change_notifier.dart';
import 'package:smart_tent_city_app/notifiers/request_change_notifier/request_change_notifier.dart';
import 'package:smart_tent_city_app/notifiers/user_type_change_notifier/user_type_change_notifier.dart';
import 'package:smart_tent_city_app/notifiers/victim_change_notifier.dart/victim_change_notifier.dart';
import 'package:smart_tent_city_app/pages/background_page.dart';
import 'package:smart_tent_city_app/pages/provider/data_change_notifier.dart';
import 'package:smart_tent_city_app/pages/request/request_customer_page.dart';
import 'package:smart_tent_city_app/pages/request/request_page_type.dart';

class RequestPage extends StatefulWidget {
  final RequestPageType type;
  final CartChangeNotifier cartNotifier;
  RequestPage({super.key, required this.type, CartChangeNotifier? notifier})
      : cartNotifier = notifier ?? CartChangeNotifier();

  @override
  State<RequestPage> createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  late RequestPageType type;
  @override
  void initState() {
    super.initState();
    type = widget.type;
  }

  @override
  Widget build(BuildContext context) {
    final UserType userType =
        Provider.of<UserTypeChangeNotifier>(context, listen: false).userType ??
            UserType.victim;
    return UserDataProviderWidget(
        userType: userType,
        child: Builder(builder: (context) {
          final tentCityId = type == RequestPageType.inventory
              ? Provider.of<ExecutiveChangeNotifier>(context, listen: false)
                  .data!
                  .tentCityId
              : Provider.of<VictimChangeNotifier>(context, listen: false)
                  .data!
                  .tentCityId;

          return Consumer<InventoryChangeNotifier>(
              builder: (context, notifier, _) {
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
                  value: widget.cartNotifier,
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
                                        setState(() {
                                          type = RequestPageType.submit;
                                        });
                                      },
                                child: Stack(
                                  children: [
                                    Positioned(
                                      child: child!,
                                    ),
                                    if (notifier.cart.isNotEmpty)
                                      Positioned(
                                        top: 12,
                                        left:
                                            MediaQuery.of(context).size.width *
                                                .043,
                                        child: Container(
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color:
                                                    CustomColors.greenAccent),
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
                                                color:
                                                    CustomColors.greenAccent),
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
                                    border: Border.all(
                                        color: Colors.redAccent.shade700),
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
                child: RequestPageBody(
                    onSubmitted: () {
                      widget.cartNotifier.cart = [];
                      setState(() {
                        type = RequestPageType.search;
                      });
                    },
                    productList: notifier.data!.products,
                    type: type),
              ),
            );
          });
        }));
  }
}

class UserDataProviderWidget extends StatelessWidget {
  final Widget child;
  final UserType userType;
  const UserDataProviderWidget(
      {super.key, required this.child, required this.userType});

  Widget _executiveDataProviderBuilder(
      BuildContext context, ExecutiveChangeNotifier notifier, Widget? child) {
    if (notifier.data == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return this.child;
  }

  Widget _victimDataProviderBuilder(
      BuildContext context, VictimChangeNotifier notifier, Widget? child) {
    if (notifier.data == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return this.child;
  }

  @override
  Widget build(BuildContext context) {
    if (userType == UserType.executive) {
      return Consumer<ExecutiveChangeNotifier>(
        builder: _executiveDataProviderBuilder,
      );
    }
    return Consumer<VictimChangeNotifier>(builder: _victimDataProviderBuilder);
  }
}
