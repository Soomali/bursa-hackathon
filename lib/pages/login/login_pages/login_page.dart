import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:smart_tent_city_app/constants/error_ids.dart';
import 'package:smart_tent_city_app/model/user_type.dart';
import 'package:smart_tent_city_app/notifiers/auth/auth_change_notifier.dart';
import 'package:smart_tent_city_app/notifiers/auth/victim_auth_change_notifier.dart';
import 'package:smart_tent_city_app/notifiers/user_type_change_notifier/user_type_change_notifier.dart';
import 'package:smart_tent_city_app/pages/login/login_input.dart';
import 'package:smart_tent_city_app/pages/login/login_pages/login_executive_page_body.dart';
import 'package:smart_tent_city_app/pages/login/login_pages/login_victim_page_body.dart';
import 'package:smart_tent_city_app/pages/main_page/main_page.dart';
import 'package:smart_tent_city_app/pages/provider/error_handler/error_handler_provider.dart';
import 'package:smart_tent_city_app/util/main_page_button_data.util.dart';

class LoginPage<T> extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2<User?, UserTypeChangeNotifier>(
        builder: (context, user, userType, _) {
      if (user != null) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => MainPage()),
              (route) => false);
        });
      }
      return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Container(
              child: Center(
                child: ErrorHandlerProvider<AuthChangeNotifier<T>>(
                    errorIds: [
                      ErrorIdConstants.emailAuthErrorId,
                      ErrorIdConstants.phoneAuthErrorId
                    ],
                    child: Consumer2<AuthChangeNotifier<T>,
                            UserTypeChangeNotifier>(
                        builder: (context, notifier, userType, _) {
                      if (userType.userType == UserType.victim) {
                        return LoginVictimPageBody(
                          notifier: notifier as VictimAuthChangeNotifier,
                        );
                      }
                      return LoginExecutivePageBody();
                    })),
              ),
            ),
          ),
        ),
      );
    });
  }
}
