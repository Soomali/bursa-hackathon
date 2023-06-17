import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:smart_tent_city_app/constants/error_ids.dart';
import 'package:smart_tent_city_app/model/user_type.dart';
import 'package:smart_tent_city_app/notifiers/auth/auth_change_notifier.dart';
import 'package:smart_tent_city_app/notifiers/auth/victim_auth_change_notifier.dart';
import 'package:smart_tent_city_app/pages/login/login_input.dart';
import 'package:smart_tent_city_app/pages/login/login_pages/login_executive_page_body.dart';
import 'package:smart_tent_city_app/pages/login/login_pages/login_victim_page_body.dart';
import 'package:smart_tent_city_app/pages/provider/auth/auth_provider.dart';
import 'package:smart_tent_city_app/pages/provider/error_handler/error_handler_provider.dart';

class LoginPage<T> extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Container(
            child: Center(
              child: ErrorHandlerProvider<AuthChangeNotifier<T>>(
                  errorIds: [ErrorIdConstants.emailAuthErrorId],
                  child: Consumer2<AuthChangeNotifier<T>, UserType>(
                      builder: (context, notifier, userType, _) {
                    if (userType == UserType.victim) {
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
  }
}
