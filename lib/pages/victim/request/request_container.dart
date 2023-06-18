import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:smart_tent_city_app/constants/asset_icons.dart';
import 'package:smart_tent_city_app/constants/custom_colors.dart';
import 'package:smart_tent_city_app/model/ProductModel.dart';
import 'package:smart_tent_city_app/notifiers/cart_change_notifier/cart_change_notifier.dart';
import 'package:smart_tent_city_app/pages/request/request_page_type.dart';

class RequestContainer extends StatefulWidget {
  final CartModel model;
  final double radius;
  final RequestPageType type;
  RequestContainer(
      {Key? key, required this.model, this.radius = 8, required this.type})
      : super(key: key);

  @override
  State<RequestContainer> createState() => _RequestContainerState();
}

class _RequestContainerState extends State<RequestContainer> {
  Widget MyFloatingActionButton() {
    if (widget.type == RequestPageType.inventory) {
      return Text("${widget.model.productModel.amount}");
    } else {
      return Container(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (widget.model.amount > 0) ...[
            IconButton(
              onPressed: () {
                Provider.of<CartChangeNotifier>(context, listen: false)
                    .decrement(widget.model.productModel);
              },
              icon: Icon(
                Icons.remove_circle,
                size: 21,
              ),
            ),
            Text(
              "${widget.model.amount}",
              style: TextStyle(fontSize: 16),
            ),
          ],
          IconButton(
            onPressed: () {
              Provider.of<CartChangeNotifier>(context, listen: false)
                  .increment(widget.model.productModel);
            },
            icon: Icon(Icons.add_circle, size: 21),
          ),
        ],
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(color: CustomColors.greenAccent),
      child: IconTheme(
        data: IconThemeData(color: CustomColors.greenAccent),
        child: Container(
          height: 140,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: CustomColors.greenAccent, width: 1.6),
              borderRadius: BorderRadius.all(Radius.circular(widget.radius))),
          child: Center(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Transform.rotate(
                  angle: -0.5,
                  child: SvgPicture.asset(
                    AssetIconConstants.icons
                            .contains(widget.model.productModel.type)
                        ? 'assets/svg_/${widget.model.productModel.type}.svg'
                        : 'assets/inventory.svg',
                    width: 24,
                  )),
              SizedBox(width: 5, height: 24),
              Text(widget.model.productModel.type),
              SizedBox(width: 3, height: 1),
              Center(child: MyFloatingActionButton()),
              SizedBox(width: 1)
            ]),
          ),
        ),
      ),
    );
  }
}
