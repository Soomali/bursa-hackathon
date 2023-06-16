import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_tent_city_app/firebase_options.dart';
import 'package:smart_tent_city_app/notifiers/auth/auth_change_notifier.dart';
import 'package:smart_tent_city_app/notifiers/executive_change_notifier/executive_change_notifier.dart';
import 'package:smart_tent_city_app/notifiers/inventory_change_notifier/inventory_change_notifier.dart';
import 'package:smart_tent_city_app/notifiers/tent_change_notifier/tent_change_notifier.dart';
import 'package:smart_tent_city_app/notifiers/victim_change_notifier.dart/victim_change_notifier.dart';
import 'package:smart_tent_city_app/pages/login/login_pages/login_executive_page.dart';
import 'package:smart_tent_city_app/pages/onboarding/onboarding_page.dart';
import 'package:smart_tent_city_app/pages/provider/auth/auth_provider.dart';
import 'package:smart_tent_city_app/pages/provider/auth/auth_state_hoister.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const SmartTent());
}

class SmartTent extends StatelessWidget {
  const SmartTent({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ExecutiveChangeNotifier()),
        ChangeNotifierProvider(create: (context) => VictimChangeNotifier()),
        ChangeNotifierProvider(create: (context) => InventoryChangeNotifier()),
        ChangeNotifierProvider(create: (context) => TentChangeNotifier()),
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
