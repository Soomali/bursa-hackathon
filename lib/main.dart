import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_tent_city_app/firebase_options.dart';
import 'package:smart_tent_city_app/notifiers/auth/auth_change_notifier.dart';
import 'package:smart_tent_city_app/notifiers/executive_change_notifier/executive_change_notifier.dart';
import 'package:smart_tent_city_app/notifiers/inventory_change_notifier/inventory_change_notifier.dart';
import 'package:smart_tent_city_app/notifiers/prefs/prefs.dart';
import 'package:smart_tent_city_app/notifiers/tent_change_notifier/tent_change_notifier.dart';
import 'package:smart_tent_city_app/notifiers/victim_change_notifier.dart/victim_change_notifier.dart';
import 'package:smart_tent_city_app/pages/login/login_pages/login_executive_page.dart';
import 'package:smart_tent_city_app/pages/onboarding/onboarding_page.dart';
import 'package:smart_tent_city_app/pages/provider/auth/auth_provider.dart';
import 'package:smart_tent_city_app/pages/provider/auth/auth_state_hoister.dart';

import 'model/user_type.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final UserType? userType = await LocalStorage().getUserType();
  runApp(SmartTent(
    userType: userType,
  ));
}

class SmartTent extends StatelessWidget {
  final UserType? userType;
  const SmartTent({super.key, this.userType});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ExecutiveChangeNotifier()),
        ChangeNotifierProvider(create: (context) => VictimChangeNotifier()),
        ChangeNotifierProvider(create: (context) => InventoryChangeNotifier()),
        ChangeNotifierProvider(create: (context) => TentChangeNotifier()),
        if (userType != null) Provider.value(value: userType!)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AuthProvider(
            child: AuthStateHoister(
                authenticatedWidget: const LoginExecutivePage(),
                unAuthenticatedWidget: const OnboardingPage())),
      ),
    );
  }
}
