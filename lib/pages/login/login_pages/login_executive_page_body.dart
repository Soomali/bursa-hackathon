import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_tent_city_app/pages/login/login_button.dart';
import 'package:smart_tent_city_app/pages/login/login_input.dart';

class LoginExecutivePageBody<T> extends StatefulWidget {
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
        SvgPicture.asset(
          'assets/tent.svg',
          height: MediaQuery.of(context).size.height * .27,
          width: MediaQuery.of(context).size.width * .6,
        ),
        SizedBox(
          height: 25,
        ),
        const Text(
          "Çadır Kent Yönetim Sistemi",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors
                .black, // Yazının rengini istediğiniz gibi ayarlayabilirsiniz
          ),
        ),
        SizedBox(
          height: 25,
        ),
        LoginInput(
            keyboardType: TextInputType.emailAddress,
            maxLength: 50,
            hintText: "e-mail"),
        SizedBox(
          height: 10,
        ),
        LoginInput(
            keyboardType: TextInputType.text, maxLength: 50, hintText: "Şifre"),
        SizedBox(
          height: 15,
        ),
        Center(
            child: LoginButton(
          onPressed: () {},
        )),
        SizedBox(
          height: 15,
        )
      ],
    );
  }
}
