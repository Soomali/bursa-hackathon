import 'package:firebase_auth/firebase_auth.dart';
import 'package:smart_tent_city_app/constants/error_ids.dart';
import 'package:smart_tent_city_app/constants/error_messages.dart';
import 'package:smart_tent_city_app/model/user_type.dart';
import 'package:smart_tent_city_app/notifiers/auth/auth_change_notifier.dart';
import 'package:smart_tent_city_app/notifiers/auth/phone_auth_state.dart';
import 'package:smart_tent_city_app/notifiers/prefs/prefs.dart';

class VictimAuthChangeNotifier extends AuthChangeNotifier<String> {
  PhoneAuthState phoneAuthState = PhoneAuthState.idle;
  String _verificationId = '';
  String phoneNumber = '';
  //auth data refers to the phone code
  @override
  void authenticate(String authData) async {
    registerForAuthentication(authData);
  }

  void sendPhoneCode(String code) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId, smsCode: code);
    wrapAsync(() async {
      await FirebaseAuth.instance.signInWithCredential(credential);
      LocalStorage().setUserType(UserType.victim);
      LocalStorage().setPhoneNumber(phoneNumber);
    }, ErrorIdConstants.phoneAuthErrorId, ErrorMessageConstants.phoneAuthError);
  }

  void _changePhoneAuthState(PhoneAuthState newState) {
    this.phoneAuthState = newState;
    notifyListeners();
  }

  void registerForAuthentication(String phoneNumber) async {
    this.phoneNumber = phoneNumber.substring(1);
    _changePhoneAuthState(PhoneAuthState.codeWaiting);
    wrapAsync(() async {
      await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          timeout: Duration(minutes: 1),
          verificationCompleted: (_) {
            _changePhoneAuthState(PhoneAuthState.codeVerified);
            LocalStorage().setUserType(UserType.executive);
            LocalStorage().setPhoneNumber(phoneNumber.substring(1));
          },
          verificationFailed: (error) {
            _changePhoneAuthState(PhoneAuthState.error);
          },
          codeSent: (String verificationId, [int? resendToken]) {
            this._verificationId = verificationId;
            _changePhoneAuthState(PhoneAuthState.codeSent);
          },
          codeAutoRetrievalTimeout: (_) {});
    }, ErrorIdConstants.emailAuthErrorId, ErrorMessageConstants.phoneAuthError);
  }
}
