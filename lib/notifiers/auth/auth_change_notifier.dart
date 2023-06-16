import 'package:firebase_auth/firebase_auth.dart';
import 'package:smart_tent_city/notifiers/async_change_notifier.dart';

abstract class AuthChangeNotifier<T> extends AsyncChangeNotifier {
  Stream<FirebaseUser> userStream = FirebaseAuth.instance.onAuthStateChanged;
  void authenticate(T authData);
}
