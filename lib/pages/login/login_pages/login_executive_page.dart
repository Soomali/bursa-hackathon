import 'package:flutter/material.dart';
import 'package:smart_tent_city_app/pages/login/login_input.dart';

import '../login_button.dart';

class LoginExecutivePage extends StatelessWidget {
  const LoginExecutivePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Center(
              child: Column(
            children: [
              Stack(alignment: Alignment.center, children: [
                Image.asset("assets/svgviewer-output 1.png"),
                Positioned(
                  bottom:
                      10, // İstediğiniz yüksekliği buradan ayarlayabilirsiniz
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 20,
                    alignment: Alignment.center,
                    child: Text(
                      "Çadır Kent Yönetim Sistemi",
                      style: TextStyle(
                        color: Colors
                            .black, // Yazının rengini istediğiniz gibi ayarlayabilirsiniz
                      ),
                    ),
                  ),
                ),
              ]),
              SizedBox(height: 30, width: double.infinity),
              login_input(
                  keyboardType: TextInputType.emailAddress,
                  maxLength: 50,
                  hintText: "e-mail"),
              SizedBox(height: 10, width: double.infinity),
              login_input(
                  keyboardType: TextInputType.text,
                  maxLength: 50,
                  hintText: "Şifre"),
              SizedBox(height: 15, width: double.infinity),
              Center(child: LoginButton()),
              SizedBox(height: 15, width: double.infinity)
            ],
          )),
        ),
      ),
    );
  }
}
