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
import 'package:smart_tent_city_app/notifiers/user_type_change_notifier/user_type_change_notifier.dart';
import 'package:smart_tent_city_app/notifiers/victim_change_notifier.dart/victim_change_notifier.dart';
import 'package:smart_tent_city_app/pages/onboarding/onboarding_page.dart';
import 'package:smart_tent_city_app/util/main_page_button_data.util.dart';

import 'model/user_type.dart';
import 'pages/components/NavigationBar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final UserType? userType = await LocalStorage().getUserType();
  // FirebaseAuth.instance.signOut();
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
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ExecutiveChangeNotifier()),
        ChangeNotifierProvider(create: (context) => VictimChangeNotifier()),
        ChangeNotifierProvider(create: (context) => InventoryChangeNotifier()),
        ChangeNotifierProvider(create: (context) => TentChangeNotifier()),
        ChangeNotifierProvider(
            create: (context) =>
                UserTypeChangeNotifier(userType: widget.userType))
      ],
      child: StreamProvider<User?>.value(
          value: FirebaseAuth.instance.authStateChanges(),
          initialData: null,
          child: Builder(builder: (context) {
            return Consumer2<User?, UserTypeChangeNotifier>(
              builder: (context, user, userType, _) {
                if (user != null) {
                  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                    if (userType.userType == UserType.executive) {
                      Provider.of<ExecutiveChangeNotifier>(context,
                              listen: false)
                          .get(user.uid);
                    } else {
                      Provider.of<VictimChangeNotifier>(context, listen: false)
                          .get(user.uid);
                    }
                  });
                }
                return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    home:
                        user == null ? OnboardingPage() : NavigationBarPage());
              },
            );
          })),
    );
  }
}
