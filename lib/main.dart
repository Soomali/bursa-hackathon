import 'package:firebase_auth/firebase_auth.dart';
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
import 'package:smart_tent_city_app/pages/main_page/main_page.dart';
import 'package:smart_tent_city_app/pages/onboarding/onboarding_page.dart';
import 'package:smart_tent_city_app/pages/provider/auth/auth_provider.dart';

import 'model/user_type.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final UserType? userType = await LocalStorage().getUserType();
  runApp(SmartTent(
    userType: userType,
  ));
}

class SmartTent extends StatefulWidget {
  final UserType? userType;
  const SmartTent({super.key, this.userType});

  @override
  State<SmartTent> createState() => _SmartTentState();
}

class _SmartTentState extends State<SmartTent> {
  User? before;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ExecutiveChangeNotifier()),
        ChangeNotifierProvider(create: (context) => VictimChangeNotifier()),
        ChangeNotifierProvider(create: (context) => InventoryChangeNotifier()),
        ChangeNotifierProvider(create: (context) => TentChangeNotifier()),
        if (widget.userType != null) Provider.value(value: widget.userType!)
      ],
      child: StreamProvider<User?>.value(
          value: FirebaseAuth.instance.authStateChanges(),
          initialData: null,
          child: Builder(builder: (context) {
            return Consumer<User?>(
              builder: (context, user, _) {
                return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    home: user == null ? OnboardingPage() : MainPage());
              },
            );
          })),
    );
  }
}
