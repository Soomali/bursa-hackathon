import 'package:flutter/material.dart';
import 'package:smart_tent_city_app/model/ProductModel.dart';
import 'package:smart_tent_city_app/pages/request/request_container.dart';
import 'package:smart_tent_city_app/pages/request/request_customer_page_slider.dart';
import '../background_page.dart';
import '../login/login_button.dart';

class RequestPage extends StatelessWidget {
  final List<ProductModel> lister;
  RequestPage({required this.lister, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundPage(
      child: Column(children: [
        SizedBox(
            height: MediaQuery.of(context).size.height *.1,child: CategorySlider(categories: ["categories","Yemek","Giyim","Sağlık","Yemek","Giyim","Yemek","Giyim","Yemek","Giyim"])),
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
              children: lister
                  .map((containerRequest) {
                return RequestContainer(
                    model: containerRequest, isVictim: true);
              })
                  .toList()
                  .cast<Widget>(),
            ),
          ),
        ),
        const Divider(color: Colors.red),
        LoginButton(
          title: "Talep Oluştur",
          onPressed: () {},
        ),
        SizedBox(height: 7,)
      ]),
    );
  }
}
