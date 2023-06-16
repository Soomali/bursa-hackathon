import 'package:firebase_auth/firebase_auth.dart';
import 'package:smart_tent_city_app/model/error_wrapper.dart';
import 'package:smart_tent_city_app/notifiers/async_change_notifier.dart';

abstract class AuthChangeNotifier<T> extends AsyncChangeNotifier
    with ErrorWrapper {
  Stream<User?> userStream = FirebaseAuth.instance.authStateChanges();
  void authenticate(T authData);
}
