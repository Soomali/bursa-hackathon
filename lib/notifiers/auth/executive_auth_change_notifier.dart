import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:smart_tent_city_app/constants/error_ids.dart';
import 'package:smart_tent_city_app/constants/error_messages.dart';
import 'package:smart_tent_city_app/model/user_type.dart';
import 'package:smart_tent_city_app/notifiers/auth/auth_change_notifier.dart';
import 'package:smart_tent_city_app/notifiers/auth/executive_auth_data.dart';
import 'package:smart_tent_city_app/notifiers/prefs/prefs.dart';

class ExecutiveAuthChangeNotifier
    extends AuthChangeNotifier<ExecutiveAuthData> {
  @override
  void authenticate(ExecutiveAuthData authData) async {
    wrapAsync(() async {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: authData.email, password: authData.password);
      LocalStorage().setUserType(UserType.executive);
    }, ErrorIdConstants.emailAuthErrorId, ErrorMessageConstants.emailAuthError);
  }
}
