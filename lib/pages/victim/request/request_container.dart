import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_tent_city_app/model/ProductModel.dart';
import 'package:smart_tent_city_app/notifiers/cart_change_notifier/cart_change_notifier.dart';
import 'package:smart_tent_city_app/pages/request/request_page_type.dart';

class RequestContainer extends StatefulWidget {
  final CartModel model;

  final RequestPageType type;
  RequestContainer({Key? key, required this.model, required this.type})
      : super(key: key);

  @override
  State<RequestContainer> createState() => _RequestContainerState();
}

class _RequestContainerState extends State<RequestContainer> {
  Widget MyFloatingActionButton() {
    if (widget.type == RequestPageType.inventory) {
      return Text("${widget.model.amount}");
    } else {
      return Container(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (widget.model.amount > 0)
            IconButton(
              onPressed: () {
                Provider.of<CartChangeNotifier>(context, listen: false)
                    .decrement(widget.model.productModel);
              },
              icon: Icon(
                Icons.remove,
                size: 21,
              ),
            ),
          Text(
            "${widget.model.amount}",
            style: TextStyle(fontSize: 16),
          ),
          IconButton(
            onPressed: () {
              Provider.of<CartChangeNotifier>(context, listen: false)
                  .increment(widget.model.productModel);
            },
            icon: Icon(Icons.add, size: 21),
          ),
        ],
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 110,
        decoration: const BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Icon(Icons.star, size: 35),
            SizedBox(width: 5, height: 7),
            Text(widget.model.productModel.type),
            SizedBox(width: 3, height: 3),
            Center(child: MyFloatingActionButton()),
            SizedBox(width: 1)
          ]),
        ),
      ),
    );
  }
}
