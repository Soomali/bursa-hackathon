import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:smart_tent_city_app/notifiers/auth/auth_change_notifier.dart';

class AuthProvider extends StatelessWidget {
  final AuthChangeNotifier authNotifier;
  final Widget child;
  AuthProvider({required this.authNotifier, required this.child});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<User?>.value(
      value: authNotifier.userStream,
      initialData: null,
      child: child,
    );
  }
}