import 'package:flutter/material.dart';
import 'package:smart_tent_city_app/model/ProductModel.dart';
import 'package:smart_tent_city_app/pages/request/request_container.dart';

import '../background_page.dart';
import '../login/login_button.dart';

class RequestDetailPage extends StatelessWidget {
  final List<ProductModel> listereq;
  RequestDetailPage({required this.listereq, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundPage(
      child: Column(children: [
        MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(10),
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            crossAxisCount: 3,
            children: listereq
                .map((containerRequest) {
                  return RequestContainer(
                      model: containerRequest, isVictim: true);
                })
                .toList()
                .cast<Widget>(),
          ),
        ),
        const Divider(color: Colors.red),
        LoginButton(
          title: "Talep Oluştur",
          onPressed: () {},
        )
      ]),
    );
  }
}
