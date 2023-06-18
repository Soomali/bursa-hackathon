import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:smart_tent_city_app/notifiers/auth/auth_change_notifier.dart';
import 'package:smart_tent_city_app/notifiers/auth/executive_auth_data.dart';
import 'package:smart_tent_city_app/pages/login/login_button.dart';
import 'package:smart_tent_city_app/pages/login/login_input.dart';

class LoginExecutivePageBody extends StatefulWidget {
  const LoginExecutivePageBody({super.key});

  @override
  State<LoginExecutivePageBody> createState() => _LoginExecutivePageBodyState();
}

class _LoginExecutivePageBodyState extends State<LoginExecutivePageBody> {
  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40,
        ),
        Image.asset(
          'assets/logo2.png',
          fit: BoxFit.fitWidth,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * .27,
        ),
        SizedBox(
          height: 25,
        ),
        LoginInput(
            keyboardType: TextInputType.emailAddress,
            maxLength: 50,
            onChanged: (val) {
              setState(() {
                email = val;
              });
            },
            hintText: "e-mail"),
        SizedBox(
          height: 10,
        ),
        LoginInput(
            onChanged: (val) {
              setState(() {
                password = val;
              });
            },
            obsecureText: true,
            keyboardType: TextInputType.text,
            maxLength: 50,
            hintText: "Şifre"),
        SizedBox(
          height: 15,
        ),
        Center(
            child: LoginButton(
          onPressed: () {
            final notifier = Provider.of<AuthChangeNotifier<ExecutiveAuthData>>(
                context,
                listen: false);
            notifier.authenticate(
                ExecutiveAuthData(email: email, password: password));
          },
          title: "Giriş Yap",
        )),
        SizedBox(
          height: 15,
        )
      ],
    );
  }
}
