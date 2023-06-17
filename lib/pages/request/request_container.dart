import 'package:flutter/material.dart';

class RequestContainer extends StatefulWidget {
  String urun;
  RequestContainer({Key? key, required this.urun}) : super(key: key);

  @override
  State<RequestContainer> createState() => _RequestContainerState();
}

class _RequestContainerState extends State<RequestContainer> {
  late bool isVictim;
  late int amount;

  Widget MyFloatingActionButton(bool isVictim, int amount) {
    if (!isVictim) {
      return Text("${amount}");
    } else {
      if (amount > 0) {
        return Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.add, size: 21),
            ),
            Text(
              "${amount}",
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
            Text("${amount}")
          ],
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: SafeArea(
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
                Text(widget.urun),
                SizedBox(width: 3, height: 3),
                Center(child: MyFloatingActionButton(true, 15)),
                SizedBox(width: 1)
              ]),
            ),
          ),
        ),
      ),
    ));
  }
}
