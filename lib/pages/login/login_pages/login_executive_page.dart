import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_tent_city_app/pages/login/login_input.dart';

import '../login_button.dart';

class LoginExecutivePage extends StatelessWidget {
  const LoginExecutivePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Container(
            child: Center(
                child: Column(
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
                    keyboardType: TextInputType.text,
                    maxLength: 50,
                    hintText: "Şifre"),
                SizedBox(
                  height: 15,
                ),
                Center(child: LoginButton()),
                SizedBox(
                  height: 15,
                )
              ],
            )),
          ),
        ),
      ),
    );
  }
}
