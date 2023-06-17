import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_tent_city_app/model/ProductModel.dart';
import 'package:smart_tent_city_app/pages/background_page.dart';
import 'package:smart_tent_city_app/pages/complaint/complaint_page.dart';
import 'package:smart_tent_city_app/pages/onboarding/style.dart';
import 'package:smart_tent_city_app/pages/request/request_customer_page.dart';
import 'package:smart_tent_city_app/pages/request/request_page.dart';
import 'package:smart_tent_city_app/pages/request/request_page_type.dart';

class RequestChoiceOption extends StatelessWidget {
  final Style style;
  final String iconPath;
  final String label;
  final VoidCallback onPress;
  RequestChoiceOption(
      {super.key,
      this.style = Style.normal,
      required this.iconPath,
      required this.label,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * .08),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color:
              style == Style.normal ? Colors.redAccent.shade700 : Colors.white,
          border: Border.all(color: Colors.redAccent.shade700),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 12,
            ),
            SvgPicture.asset(
              iconPath,
              color: style == Style.normal
                  ? Colors.white
                  : Colors.redAccent.shade700,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              label,
              style: TextStyle(
                  color: style == Style.normal
                      ? Colors.white
                      : Colors.redAccent.shade700,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}

class RequestChoicePage extends StatelessWidget {
  const RequestChoicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundPage(
        child: Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .06),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          RequestChoiceOption(
              iconPath: 'assets/Bag.svg',
              label: 'Ürün talep et',
              onPress: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => RequestPage(
                            type: RequestPageType.search,
                          )),
                );
              }),
          RequestChoiceOption(
            iconPath: 'assets/complaint.svg',
            label: 'İstek ve Şikayet',
            onPress: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ComplaintPage()));
            },
            style: Style.inverted,
          ),
        ],
      ),
    ));
  }
}
