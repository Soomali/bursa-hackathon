import 'package:flutter/material.dart';
import 'package:smart_tent_city_app/pages/login/login_input.dart';

import '../../SVG_IMAGE.dart';
import '../login_button.dart';

class LoginExecutivePage extends StatelessWidget {
  const LoginExecutivePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(builder: (context) {
        return SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Container(
                child: Center(
                    child: Column(
                  children: [
                    ColoredBox(
                        color: Colors.red,
                        child: SvgImage(path: "assets/svgviewer-output 1.png")),
                    Container(
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
                    login_input(
                        keyboardType: TextInputType.emailAddress,
                        maxLength: 50,
                        hintText: "e-mail"),
                    SizedBox(
                      height: 10,
                    ),
                    login_input(
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
      }),
    );
  }
}
