import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_tent_city_app/constants/firebase.dart';
import 'package:smart_tent_city_app/model/ProductModel.dart';
import 'package:smart_tent_city_app/model/RequestModel.dart';
import 'package:smart_tent_city_app/model/RequestStatus.dart';
import 'package:smart_tent_city_app/notifiers/async_change_notifier_state.dart';
import 'package:smart_tent_city_app/notifiers/cart_change_notifier/cart_change_notifier.dart';
import 'package:smart_tent_city_app/notifiers/inventory_change_notifier/inventory_change_notifier.dart';
import 'package:smart_tent_city_app/notifiers/request_change_notifier/request_change_notifier.dart';
import 'package:smart_tent_city_app/notifiers/victim_change_notifier.dart/victim_change_notifier.dart';
import 'package:smart_tent_city_app/pages/login/login_input.dart';
import 'package:smart_tent_city_app/pages/request/request_customer_page_slider.dart';
import 'package:smart_tent_city_app/pages/request/request_page.dart';
import 'package:smart_tent_city_app/pages/request/request_page_type.dart';
import 'package:smart_tent_city_app/pages/victim/request/request_container.dart';
import 'package:smart_tent_city_app/util/utils.dart';
import '../background_page.dart';
import '../login/login_button.dart';

class RequestPageBody extends StatefulWidget {
  final List<ProductModel> productList;
  final RequestPageType type;

  RequestPageBody({required this.productList, required this.type, Key? key})
      : super(key: key);

  @override
  State<RequestPageBody> createState() => _RequestPageBodyState();
}

class _RequestPageBodyState extends State<RequestPageBody> {
  String? currentCategory;
  late List<String> categories;
  late List<ProductModel> products;
  bool isShowingProgressIndicator = false;
  @override
  void initState() {
    super.initState();
    categories = getCategories();
    products = widget.productList;
    if (widget.type != RequestPageType.submit) {
      currentCategory = categories[0];
    }
  }

  List<String> getCategories() {
    return widget.productList.map((e) => e.category).toSet().toList();
  }

  List<ProductModel> getCategoriesProducts(String category) {
    return widget.productList
        .where((element) => element.category == category)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<CartChangeNotifier, RequestChangeNotifier>(
        builder: (context, notifier, requestNotifier, _) {
      if (requestNotifier.state == AsyncChangeNotifierState.done &&
          isShowingProgressIndicator) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        });
      } else if (requestNotifier.state == AsyncChangeNotifierState.busy &&
          !isShowingProgressIndicator) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          showDialog(
              context: context,
              builder: (context) => Center(
                    child: CircularProgressIndicator(),
                  ));
        });
      }
      List<CartModel> shownProducts;
      if (widget.type == RequestPageType.submit) {
        shownProducts = notifier.cart;
      } else {
        shownProducts = getCategoriesProducts(currentCategory!)
            .map((e) => CartModel(notifier.amountOf(e), e))
            .toList();
      }
      return _RequestBody(
          onTapCategory: (category) {
            setState(() {
              currentCategory = category;
            });
          },
          onTapCard: (CartModel model) {
            final inventoryChangeNotifier =
                Provider.of<InventoryChangeNotifier>(context, listen: false);
            inventoryChangeNotifier.state = AsyncChangeNotifierState.idle;

            showDialog(
                context: context,
                builder: (context) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * .3,
                        horizontal: MediaQuery.of(context).size.width * .2),
                    child: Material(
                        child: _UpdateInventoryWidget(
                            type: widget.type, cartModel: model)),
                  );
                });
          },
          onTapSubmit: () {
            final victimData =
                Provider.of<VictimChangeNotifier>(context, listen: false).data!;
            final RequestModel requestModel = RequestModel(
              products: products,
              status: RequestStatus.waiting,
              victimId: victimData.id,
              tentCityId: victimData.tentCityId,
              id: FirebaseFirestore.instance
                  .collection(requestCollectionPath)
                  .doc()
                  .id,
            );
            requestNotifier.update(requestModel);
          },
          requestPageType: widget.type,
          shownProducts: shownProducts,
          categories: categories);
    });
  }
}

class _UpdateInventoryWidget extends StatefulWidget {
  const _UpdateInventoryWidget({
    super.key,
    required this.type,
    required this.cartModel,
  });
  final RequestPageType type;
  final CartModel cartModel;

  @override
  State<_UpdateInventoryWidget> createState() => _UpdateInventoryWidgetState();
}

class _UpdateInventoryWidgetState extends State<_UpdateInventoryWidget> {
  int newAmount = 0;
  bool isShowingCircularIndicator = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<InventoryChangeNotifier>(builder: (context, notifier, _) {
      if (notifier.state == AsyncChangeNotifierState.busy &&
          !isShowingCircularIndicator) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          isShowingCircularIndicator = true;
          showDialog(
              context: context,
              builder: (context) => Center(
                    child: CircularProgressIndicator(),
                  ));
        });
      } else if (notifier.state == AsyncChangeNotifierState.done &&
          isShowingCircularIndicator) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
          isShowingCircularIndicator = false;
        });
      }
      return Padding(
        padding: EdgeInsets.fromLTRB(12, 12, 12, 0),
        child: Column(
          children: [
            RequestContainer(model: widget.cartModel, type: widget.type),
            SizedBox(
              height: 12,
            ),
            TextField(
              decoration: InputDecoration(hintText: 'yeni adet'),
              keyboardType: TextInputType.number,
              maxLength: 5,
              onChanged: (val) {
                if (isNumeric(val)) {
                  setState(() {
                    newAmount = int.parse(val);
                  });
                }
              },
            ),
            LoginButton(
                onPressed: () {
                  final copiedModel = notifier.data!.copy();
                  copiedModel.change(
                      widget.cartModel.productModel.type, this.newAmount);
                  notifier.update(copiedModel);
                },
                title: 'Güncelle')
          ],
        ),
      );
    });
  }
}

class _RequestBody extends StatelessWidget {
  final void Function(String) onTapCategory;
  final VoidCallback onTapSubmit;
  final void Function(CartModel) onTapCard;
  final RequestPageType requestPageType;
  final List<CartModel> shownProducts;
  final List<String> categories;

  const _RequestBody({
    super.key,
    required this.onTapCategory,
    required this.onTapSubmit,
    required this.onTapCard,
    required this.requestPageType,
    required this.shownProducts,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      if (requestPageType != RequestPageType.submit)
        SizedBox(
            height: MediaQuery.of(context).size.height * .08,
            child: CategorySlider(
                onTapCategory: onTapCategory, categories: categories)),
      MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Expanded(
          child: GridView.count(
            primary: false,
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
            crossAxisSpacing: 5,
            childAspectRatio: .8,
            mainAxisSpacing: 20,
            crossAxisCount: 3,
            children: shownProducts
                .map((containerRequest) {
                  Widget widget = RequestContainer(
                    model: containerRequest,
                    type: requestPageType,
                  );
                  if (requestPageType == RequestPageType.inventory) {
                    widget = GestureDetector(
                      onTap: () => onTapCard(containerRequest),
                      child: widget,
                    );
                  }
                  return widget;
                })
                .toList()
                .cast<Widget>(),
          ),
        ),
      ),
      if (requestPageType == RequestPageType.submit)
        LoginButton(
          title: "Talep Oluştur",
          onPressed: onTapSubmit,
        ),
      SizedBox(
        height: 7,
      )
    ]);
    ;
  }
}
