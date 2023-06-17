import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_tent_city_app/model/ProductModel.dart';
import 'package:smart_tent_city_app/notifiers/cart_change_notifier/cart_change_notifier.dart';
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
    return Consumer<CartChangeNotifier>(builder: (context, notifier, _) {
      List<CartModel> shownProducts;
      if (widget.type == RequestPageType.submit) {
        shownProducts = notifier.cart;
      } else {
        shownProducts = getCategoriesProducts(currentCategory!)
            .map((e) => CartModel(notifier.amountOf(e), e))
            .toList();
      }
      return Column(children: [
        if (widget.type == RequestPageType.search)
          SizedBox(
              height: MediaQuery.of(context).size.height * .1,
              child: CategorySlider(
                  onTapCategory: (category) {
                    setState(() {
                      currentCategory = category;
                    });
                  },
                  categories: categories)),
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
                      type: widget.type,
                    );
                  })
                  .toList()
                  .cast<Widget>(),
            ),
          ),
        ),
        const Divider(color: Colors.red),
        if (widget.type == RequestPageType.submit)
          LoginButton(
            title: "Talep Oluştur",
            onPressed: () {},
          ),
        SizedBox(
          height: 7,
        )
      ]);
    });
  }
}
