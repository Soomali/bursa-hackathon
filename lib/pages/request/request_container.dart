import 'package:flutter/material.dart';
import 'package:smart_tent_city_app/model/ProductModel.dart';

class RequestContainer extends StatefulWidget {
  final ProductModel model;
  final bool isVictim;
  RequestContainer({Key? key, required this.model, required this.isVictim})
      : super(key: key);

  @override
  State<RequestContainer> createState() => _RequestContainerState();
}

class _RequestContainerState extends State<RequestContainer> {
  Widget MyFloatingActionButton(bool isVictim) {
    if (!isVictim) {
      return Text("${widget.model.amount}");
    } else {
      if (widget.model.amount > 0) {
        return Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.add, size: 21),
            ),
            Text(
              "${widget.model.amount}",
              style: TextStyle(fontSize: 16),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.remove,
                size: 21,
              ),
            )
          ],
        ));
      } else {
        return Container(
            child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.add),
            ),
            Text("${widget.model.amount}")
          ],
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: InkWell(
          onTap: () {},
          child: Container(
            width: 98,
            height: 110,
            decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: Center(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Icon(Icons.star, size: 35),
                SizedBox(width: 5, height: 7),
                Text(widget.model.type),
                SizedBox(width: 3, height: 3),
                Center(child: MyFloatingActionButton(widget.isVictim)),
                SizedBox(width: 1)
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
