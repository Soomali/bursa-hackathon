import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:smart_tent_city_app/model/user_type.dart';
import 'package:smart_tent_city_app/notifiers/user_type_change_notifier/user_type_change_notifier.dart';
import 'package:smart_tent_city_app/pages/components/NavigationBarItem.dart';
import 'package:smart_tent_city_app/pages/executive/qr_scan/qr_scan_page.dart';
import 'package:smart_tent_city_app/pages/executive/request_feedback/request_feedback.dart';
import 'package:smart_tent_city_app/pages/executive/tent_city_requests/tent_city_requests_body.dart';
import 'package:smart_tent_city_app/pages/executive/victim_processes/victim_processes_page.dart';
import 'package:smart_tent_city_app/pages/onboarding/onboarding_page.dart';
import 'package:smart_tent_city_app/pages/request/request_page.dart';
import 'package:smart_tent_city_app/pages/request/request_page_type.dart';
import 'package:smart_tent_city_app/pages/victim/announcements/announcements.dart';
import 'package:smart_tent_city_app/pages/victim/my_requests/my_requests_page.dart';
import 'package:smart_tent_city_app/pages/victim/qr_page/qr_page.dart';
import 'package:smart_tent_city_app/pages/victim/request_choice/request_choice.dart';
import 'package:smart_tent_city_app/pages/victim/requests_feedback/requests_feedback.dart';
import 'package:smart_tent_city_app/pages/victim/victim_data/victim_data.dart';

class NavigationBarPage extends StatefulWidget {
  @override
  State<NavigationBarPage> createState() => _NavigationBarPageState();
}

class _NavigationBarPageState extends State<NavigationBarPage> {
  int _selectedIndex = 0;
  final List<Widget> _victimBodies = [
    RequestChoicePage(),
    RequestsFeedbackPage(),
    QrPage(),
    VictimData(),
  ];
  final List<Widget> _executiveBodies = [
    RequestFeedback(),
    RequestPage(type: RequestPageType.inventory),
    QrScanPage(),
    VictimProcesses(),
  ];
  void _onItemTapped(int index) {
    if (index == 4) {
      FirebaseAuth.instance.signOut();
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => OnboardingPage()),
          (route) => false);
      return;
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  List<NavigationBarItem> getItems(UserType userType) {
    return [
      NavigationBarItem(
        icon: SvgPicture.asset(
          userType == UserType.executive
              ? "assets/Chat_search.svg"
              : 'assets/Chat_plus.svg',
          width: 24, // İstediğiniz boyuta göre değiştirin
          height: 24, // İstediğiniz boyuta göre değiştirin

          color: _selectedIndex == 0 ? Colors.red : Colors.grey[800],
        ),
        title: Text(
          userType == UserType.executive ? "Talepler" : 'Talep\nOluştur',textAlign:TextAlign.center,
          style: TextStyle(
            color: _selectedIndex == 0 ? Colors.red : Colors.grey[800],
          ),
        ),
        onPressed: () {
          // Buton 1'e basıldığında yapılacak işlemler
        },
      ),
      NavigationBarItem(
        icon: SvgPicture.asset(
          userType == UserType.executive
              ? "assets/inventory.svg"
              : 'assets/Message_light.svg',
          width: 24, // İstediğiniz boyuta göre değiştirin
          height: 24, // İstediğiniz boyuta göre değiştirin

          color: _selectedIndex == 1 ? Colors.red : Colors.grey[800],
        ),
        title: Text(
          userType == UserType.executive ? "Envanter" : 'Taleplerim',
          style: TextStyle(
            color: _selectedIndex == 1 ? Colors.red : Colors.grey[800],
          ),
        ),
        onPressed: () {
          // Buton 1'e basıldığında yapılacak işlemler
        },
      ),
      NavigationBarItem(
        icon: SvgPicture.asset(
          "assets/qr-code-svgrepo-com.svg",
          width: 30,
          height: 30,
          color: _selectedIndex == 2 ? Colors.red : Colors.grey[800],
        ),
        title: Text(
          "QR",
          style: TextStyle(
            color: _selectedIndex == 2 ? Colors.red : Colors.grey[800],
          ),
        ),
        onPressed: () {
          // Buton 1'e basıldığında yapılacak işlemler
        },
      ),
      NavigationBarItem(
        icon: SvgPicture.asset(
          userType == UserType.executive
              ? 'assets/injured_person.svg'
              : 'assets/User_light.svg',
          width: 24, // İstediğiniz boyuta göre değiştirin
          height: 24, // İstediğiniz boyuta göre değiştirin

          color: _selectedIndex == 3 ? Colors.red : Colors.grey[800],
        ),
        title: Text(
          userType == UserType.executive ? "Depremzede" : 'Profil',
          style: TextStyle(
            color: _selectedIndex == 3 ? Colors.red : Colors.grey[800],
          ),
        ),
        onPressed: () {},
      ),
      NavigationBarItem(
        icon: SvgPicture.asset(
          'assets/Sign_out_squre_light.svg',
          width: 30,
          height: 30,
          color: Colors.grey[800],
        ),
        title: Text(
          "Çıkış",
          style: TextStyle(
            color: Colors.grey[800],
          ),
        ),
        onPressed: () {
          FirebaseAuth.instance.signOut();
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final userType =
        Provider.of<UserTypeChangeNotifier>(context, listen: false).userType;
    return SafeArea(
      child: Scaffold(
        floatingActionButton:
            _selectedIndex == 0 || _selectedIndex == _victimBodies.length
                ? null
                : FloatingActionButton(
                    backgroundColor: Colors.redAccent.shade700,
                    onPressed: () {
                      setState(() {
                        _selectedIndex = _victimBodies.length;
                      });
                    },
                    child: Icon(Icons.notifications),
                  ),
        body: userType == UserType.victim
            ? _selectedIndex == this._victimBodies.length
                ? AnnouncementPage()
                : this._victimBodies[_selectedIndex]
            : _selectedIndex == this._executiveBodies.length
                ? AnnouncementPage()
                : this._executiveBodies[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: getItems(userType ?? UserType.victim)
              .asMap()
              .entries
              .map((entry) {
            final index = entry.key;
            final item = entry.value;

            return BottomNavigationBarItem(
              icon: GestureDetector(
                onTap: () {
                  _onItemTapped(index);
                },
                child: Column(
                  children: [
                    Container(
                        width: 24, // İkonun genişliği
                        height: 24, // İkonun yüksekliği

                        child: item.icon),
                    item.title
                  ],
                ),
              ),
              label: '',
            );
          }).toList(),
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
