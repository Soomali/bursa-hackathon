import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_tent_city_app/pages/onboarding/style.dart';

class OnboardingButton extends StatelessWidget {
  final String label;
  final String iconPath;
  final VoidCallback onPress;
  final Style style;

  const OnboardingButton(
      {super.key,
      required this.label,
      required this.iconPath,
      required this.onPress,
      this.style = Style.normal});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
            color: style == Style.inverted ? Colors.white : Colors.redAccent,
            border: Border.all(color: Colors.redAccent),
            borderRadius: BorderRadius.circular(12)),
        width: MediaQuery.of(context).size.width * .7,
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * .05),
        height: MediaQuery.of(context).size.height * .35,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(
              iconPath,
              width: 80,
              height: 80,
              color: style == Style.inverted ? Colors.red : Colors.white,
            ),
            Text(
              label,
              style: TextStyle(
                  color: style == Style.inverted ? Colors.red : Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
