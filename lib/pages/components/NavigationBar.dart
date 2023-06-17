import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:smart_tent_city_app/model/user_type.dart';
import 'package:smart_tent_city_app/notifiers/user_type_change_notifier/user_type_change_notifier.dart';
import 'package:smart_tent_city_app/pages/components/NavigationBarItem.dart';
import 'package:smart_tent_city_app/pages/executive/executive_data/executive_data.dart';
import 'package:smart_tent_city_app/pages/executive/qr_scan/qr_scan_page.dart';
import 'package:smart_tent_city_app/pages/executive/request_feedback/request_feedback.dart';
import 'package:smart_tent_city_app/pages/executive/tent_city_requests/tent_city_requests_body.dart';
import 'package:smart_tent_city_app/pages/executive/victim_processes/victim_processes_page.dart';
import 'package:smart_tent_city_app/pages/request/request_page.dart';
import 'package:smart_tent_city_app/pages/request/request_page_type.dart';
import 'package:smart_tent_city_app/pages/victim/my_requests/my_requests_page.dart';
import 'package:smart_tent_city_app/pages/victim/qr_page/qr_page.dart';
import 'package:smart_tent_city_app/pages/victim/request_choice/request_choice.dart';
import 'package:smart_tent_city_app/pages/victim/victim_data/victim_data.dart';

class NavigationBarPage extends StatefulWidget {
  @override
  State<NavigationBarPage> createState() => _NavigationBarPageState();
}

class _NavigationBarPageState extends State<NavigationBarPage> {
  int _selectedIndex = 0;
  final List<Widget> _victimBodies = [
    RequestChoicePage(),
    MyRequestsPage(),
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
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  List<NavigationBarItem> getItems() {
    return [
      NavigationBarItem(
        icon: SvgPicture.asset(
          "assets/Chat_plus.svg",
          width: 24, // İstediğiniz boyuta göre değiştirin
          height: 24, // İstediğiniz boyuta göre değiştirin

          color: _selectedIndex == 0 ? Colors.red : Colors.grey[800],
        ),
        title: Text(
          "Talep Oluştur",
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
          "assets/Message_light.svg",
          width: 24, // İstediğiniz boyuta göre değiştirin
          height: 24, // İstediğiniz boyuta göre değiştirin

          color: _selectedIndex == 1 ? Colors.red : Colors.grey[800],
        ),
        title: Text(
          "Taleplerim",
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
          'assets/User_light.svg',
          width: 24, // İstediğiniz boyuta göre değiştirin
          height: 24, // İstediğiniz boyuta göre değiştirin

          color: _selectedIndex == 3 ? Colors.red : Colors.grey[800],
        ),
        title: Text(
          "Profilim",
          style: TextStyle(
            color: _selectedIndex == 3 ? Colors.red : Colors.grey[800],
          ),
        ),
        onPressed: () {
          // Buton 1'e basıldığında yapılacak işlemler
        },
      ),
      NavigationBarItem(
        icon: SvgPicture.asset(
          'assets/Sign_out_squre_light.svg',
          width: 30, // İstediğiniz boyuta göre değiştirin
          height: 30, // İstediğiniz boyuta göre değiştirin

          color: _selectedIndex == 4 ? Colors.red : Colors.grey[800],
        ),
        title: Text(
          "Çıkış Yap",
          style: TextStyle(
            color: _selectedIndex == 4 ? Colors.red : Colors.grey[800],
          ),
        ),
        onPressed: () {
          // Buton 1'e basıldığında yapılacak işlemler
        },
      ),

      // Diğer NavigationBarItem'ları buraya ekleyin
    ];
  }

  @override
  Widget build(BuildContext context) {
    final userType =
        Provider.of<UserTypeChangeNotifier>(context, listen: false).userType;
    return SafeArea(
      child: Scaffold(
        floatingActionButton: _selectedIndex == 0
            ? null
            : FloatingActionButton(
                backgroundColor: Colors.redAccent.shade700,
                onPressed: () {},
                child: Icon(Icons.notifications),
              ),
        body: userType == UserType.victim
            ? _selectedIndex == this._victimBodies.length
                ? Container()
                : this._victimBodies[_selectedIndex]
            : this._executiveBodies[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: getItems().asMap().entries.map((entry) {
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
