import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_tent_city_app/model/user_type.dart';
import 'package:smart_tent_city_app/pages/login/login_pages/login_executive_page.dart';
import 'package:smart_tent_city_app/pages/login/login_pages/login_victim_page.dart';
import 'package:smart_tent_city_app/pages/onboarding/onboarding_button.dart';
import 'package:smart_tent_city_app/pages/onboarding/style.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * .05,
              horizontal: MediaQuery.of(context).size.width * .07),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * .04),
                child: OnboardingButton(
                    label: 'Görevliyim',
                    iconPath: 'assets/help.svg',
                    onPress: () {
                      goToLogin(
                          context, LoginExecutivePage(), UserType.executive);
                    }),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .09,
              ),
              Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * .08),
                  child: OnboardingButton(
                      label: 'Depremzedeyim',
                      style: Style.inverted,
                      iconPath: 'assets/injured_person.svg',
                      onPress: () {
                        goToLogin(context, LoginVictimPage(), UserType.victim);
                      })),
            ],
          ),
        ),
      ),
    );
  }

  void goToLogin(BuildContext context, Widget page, UserType userType) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Provider<UserType>.value(
              value: userType,
              child: page,
            )));
  }
}
