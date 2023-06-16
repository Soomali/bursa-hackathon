import 'package:flutter/material.dart';
import 'package:smart_tent_city_app/pages/login/login_input.dart';

import '../login_button.dart';

class LoginVictimPage extends StatelessWidget {
  const LoginVictimPage({Key? key}) : super(key: key);

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
                      "Akıllı Çadır Kent",
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
                  keyboardType: TextInputType.phone,
                  maxLength: 11,
                  hintText: "Telefon Numarası"),
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
