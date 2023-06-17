import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_tent_city_app/pages/components/NavigationBarItem.dart';

class NavigationBarPage extends StatefulWidget {
  @override
  State<NavigationBarPage> createState() => _NavigationBarPageState();
}

class _NavigationBarPageState extends State<NavigationBarPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<NavigationBarItem> bottomNavigationBarItems = [
      NavigationBarItem(
        icon: SvgPicture.asset(
          "assets/Chat_plus.svg",
          width: 24, // İstediğiniz boyuta göre değiştirin
          height: 24, // İstediğiniz boyuta göre değiştirin
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
          color: Colors.white,
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
          'assets/Sign_out_square_light.svg',
          width: 30, // İstediğiniz boyuta göre değiştirin
          height: 30, // İstediğiniz boyuta göre değiştirin
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

    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.fromLTRB(0, 200, 0, 10),
        child: BottomNavigationBar(
          items: bottomNavigationBarItems.asMap().entries.map((entry) {
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
                        width: 78, // İkonun genişliği
                        height: 78, // İkonun yüksekliği
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _selectedIndex == index
                              ? Colors.red
                              : Colors.grey[800],
                        ),
                        child: item.icon),
                    Text(
                      item.title.data ?? '',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    )
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
