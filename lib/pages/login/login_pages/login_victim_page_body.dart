import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_tent_city_app/notifiers/auth/victim_auth_change_notifier.dart';
import 'package:smart_tent_city_app/pages/login/login_button.dart';
import 'package:smart_tent_city_app/pages/login/login_input.dart';

class LoginVictimPageBody extends StatefulWidget {
  final VictimAuthChangeNotifier notifier;
  const LoginVictimPageBody({required this.notifier, super.key});

  @override
  State<LoginVictimPageBody> createState() => _LoginVictimPageBodyState();
}

class _LoginVictimPageBodyState extends State<LoginVictimPageBody> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
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
      Center(
          child: LoginButton(
        onPressed: () {},
      )),
      SizedBox(height: 15, width: double.infinity)
    ]);
  }
}
