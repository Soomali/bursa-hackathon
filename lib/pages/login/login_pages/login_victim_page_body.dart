import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:smart_tent_city_app/constants/error_messages.dart';
import 'package:smart_tent_city_app/model/user_type.dart';
import 'package:smart_tent_city_app/notifiers/auth/auth_change_notifier.dart';
import 'package:smart_tent_city_app/notifiers/auth/victim_auth_change_notifier.dart';
import 'package:smart_tent_city_app/pages/login/login_button.dart';
import 'package:smart_tent_city_app/pages/login/login_input.dart';
import 'package:smart_tent_city_app/pages/main_page/main_page.dart';
import 'package:smart_tent_city_app/util/main_page_button_data.util.dart';

import '../../../notifiers/auth/phone_auth_state.dart';

class LoginVictimPageBody extends StatefulWidget {
  final VictimAuthChangeNotifier notifier;
  const LoginVictimPageBody({required this.notifier, super.key});

  @override
  State<LoginVictimPageBody> createState() => _LoginVictimPageBodyState();
}

class _LoginVictimPageBodyState extends State<LoginVictimPageBody> {
  String phoneNumber = '+90';
  String code = '';
  PhoneAuthState lastCalledState = PhoneAuthState.idle;
  void handlePhoneVerificationStatus(PhoneAuthState state) {
    final state = widget.notifier.phoneAuthState;
    if (state == lastCalledState) {
      return;
    }
    lastCalledState = state;
    switch (state) {
      case PhoneAuthState.idle:
        break;
      case PhoneAuthState.codeWaiting:
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) => Center(
                    child: CircularProgressIndicator(),
                  ));
        });
        break;
      case PhoneAuthState.codeSent:
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          Navigator.of(context).pop();
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    content: TextField(
                      maxLength: 6,
                      onChanged: (val) {
                        code = val;
                      },
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            widget.notifier.sendPhoneCode(code);
                          },
                          child: Text('Gönder'))
                    ],
                  ));
        });
        break;
      case PhoneAuthState.codeVerified:
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => MainPage()),
              (route) => false);
        });
        break;
      case PhoneAuthState.error:
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.of(context).pop();

          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(ErrorMessageConstants.phoneAuthError)));
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: widget.notifier,
        child: Consumer<VictimAuthChangeNotifier>(
          builder: (context, value, _) {
            handlePhoneVerificationStatus(value.phoneAuthState);
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
                  onChanged: (val) {
                    setState(() {
                      this.phoneNumber = '+90${val}';
                    });
                  },
                  hintText: "Telefon Numarası"),
              SizedBox(height: 15, width: double.infinity),
              Center(child: LoginButton(
                onPressed: () {
                  final notifier = Provider.of<AuthChangeNotifier<String>>(
                      context,
                      listen: false);
                  notifier.authenticate(phoneNumber);
                },
              )),
              SizedBox(height: 15, width: double.infinity)
            ]);
          },
        ));
  }
}
