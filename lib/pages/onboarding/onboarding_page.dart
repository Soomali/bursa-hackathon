import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_tent_city_app/model/user_type.dart';
import 'package:smart_tent_city_app/notifiers/auth/auth_change_notifier.dart';
import 'package:smart_tent_city_app/notifiers/auth/executive_auth_change_notifier.dart';
import 'package:smart_tent_city_app/notifiers/auth/executive_auth_data.dart';
import 'package:smart_tent_city_app/notifiers/auth/victim_auth_change_notifier.dart';
import 'package:smart_tent_city_app/notifiers/user_type_change_notifier/user_type_change_notifier.dart';
import 'package:smart_tent_city_app/pages/login/login_pages/login_page.dart';
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
                      goToLogin<ExecutiveAuthData>(context,
                          ExecutiveAuthChangeNotifier(), UserType.executive);
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
                        goToLogin<String>(context, VictimAuthChangeNotifier(),
                            UserType.victim);
                      })),
            ],
          ),
        ),
      ),
    );
  }

  void goToLogin<T>(
      BuildContext context, AuthChangeNotifier<T> notifier, UserType userType) {
    Provider.of<UserTypeChangeNotifier>(context, listen: false)
        .change(userType);
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>
            ChangeNotifierProvider<AuthChangeNotifier<T>>.value(
              value: notifier,
              child: LoginPage<T>(),
            )));
  }
}
