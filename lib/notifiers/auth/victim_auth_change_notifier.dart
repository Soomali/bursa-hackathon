import 'package:firebase_auth/firebase_auth.dart';
import 'package:smart_tent_city_app/notifiers/auth/auth_change_notifier.dart';
import 'package:smart_tent_city_app/notifiers/auth/phone_auth_state.dart';

class VictimAuthChangeNotifier extends AuthChangeNotifier<String> {
  PhoneAuthState phoneAuthState = PhoneAuthState.idle;
  //auth data refers to the phone code
  @override
  void authenticate(String authData) async {
    registerForAuthentication(authData);
  }

  void _changePhoneAuthState(PhoneAuthState newState) {
    this.phoneAuthState = newState;
    notifyListeners();
  }

  void registerForAuthentication(String phoneNumber) async {
    _changePhoneAuthState(PhoneAuthState.codeWaiting);
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: Duration(minutes: 1),
        verificationCompleted: (_) {
          _changePhoneAuthState(PhoneAuthState.codeVerified);
        },
        verificationFailed: (error) {
          _changePhoneAuthState(PhoneAuthState.error);
        },
        codeSent: (String verificationId, [int? resendToken]) {
          _changePhoneAuthState(PhoneAuthState.codeSent);
        },
        codeAutoRetrievalTimeout: (_) {});
  }
}
