import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_tent_city_app/notifiers/auth/auth_change_notifier.dart';

class AuthStateHoister extends StatelessWidget {
  final Widget authenticatedWidget;
  final Widget unAuthenticatedWidget;
  const AuthStateHoister({
    super.key,
    required this.authenticatedWidget,
    required this.unAuthenticatedWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<User?>(builder: (context, val, _) {
      if (val != null) {
        return authenticatedWidget;
      }
      return unAuthenticatedWidget;
    });
  }
}
