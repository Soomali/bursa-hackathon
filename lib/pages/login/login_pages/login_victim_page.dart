import 'package:flutter/material.dart';
import 'package:smart_tent_city_app/pages/login/login_input.dart';

class LoginVictimPage extends StatelessWidget {
  const LoginVictimPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
            child: Column(
          children: [
            SizedBox(
              height: 316,
              width: 339,
              child: Container(
                color: Colors.red,
              ),
            ),
            SizedBox(height: 50, width: double.infinity),
            login_input()
          ],
        )),
      ),
    );
  }
}
