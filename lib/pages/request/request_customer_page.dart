import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_tent_city_app/constants/firebase.dart';
import 'package:smart_tent_city_app/model/ProductModel.dart';
import 'package:smart_tent_city_app/model/RequestModel.dart';
import 'package:smart_tent_city_app/model/RequestStatus.dart';
import 'package:smart_tent_city_app/notifiers/async_change_notifier_state.dart';
import 'package:smart_tent_city_app/notifiers/cart_change_notifier/cart_change_notifier.dart';
import 'package:smart_tent_city_app/notifiers/request_change_notifier/request_change_notifier.dart';
import 'package:smart_tent_city_app/notifiers/victim_change_notifier.dart/victim_change_notifier.dart';
import 'package:smart_tent_city_app/pages/request/request_customer_page_slider.dart';
import 'package:smart_tent_city_app/pages/request/request_page.dart';
import 'package:smart_tent_city_app/pages/request/request_page_type.dart';
import 'package:smart_tent_city_app/pages/victim/request/request_container.dart';
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

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    products = widget.productList;
    if (widget.type == RequestPageType.search) {
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
      if (requestNotifier.state == AsyncChangeNotifierState.done) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        });
      } else if (requestNotifier.state == AsyncChangeNotifierState.busy) {
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
          onTapSubmit: () {
            final victimId =
                Provider.of<VictimChangeNotifier>(context, listen: false)
                    .data!
                    .id;
            final RequestModel requestModel = RequestModel(
              products: products,
              status: RequestStatus.waiting,
              victimId: victimId,
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

class _RequestBody extends StatelessWidget {
  final void Function(String) onTapCategory;
  final VoidCallback onTapSubmit;
  final RequestPageType requestPageType;
  final List<CartModel> shownProducts;
  final List<String> categories;

  const _RequestBody({
    super.key,
    required this.onTapCategory,
    required this.onTapSubmit,
    required this.requestPageType,
    required this.shownProducts,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      if (requestPageType == RequestPageType.search)
        SizedBox(
            height: MediaQuery.of(context).size.height * .1,
            child: CategorySlider(
                onTapCategory: onTapCategory, categories: categories)),
      MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Expanded(
          child: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(10),
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            crossAxisCount: 3,
            children: shownProducts
                .map((containerRequest) {
                  return RequestContainer(
                    model: containerRequest,
                    type: requestPageType,
                  );
                })
                .toList()
                .cast<Widget>(),
          ),
        ),
      ),
      const Divider(color: Colors.red),
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
