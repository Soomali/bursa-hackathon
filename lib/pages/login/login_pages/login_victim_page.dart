import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_tent_city_app/pages/login/login_input.dart';

import '../login_button.dart';

class LoginVictimPage extends StatelessWidget {
  const LoginVictimPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
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
                "Akıllı Çadır Kent",
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
