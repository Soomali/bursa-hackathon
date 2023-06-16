import 'package:flutter/cupertino.dart';
import 'package:smart_tent_city_app/pages/main_page/request_button_widget.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Row(
            children: [
              RequestButtonWidget(
                iconPath: "assets/Chat_plus.svg",
                data: "Talep Oluştur",
              ),
              SizedBox(width: 12),
              RequestButtonWidget(
                iconPath: "assets/Message_light.svg",
                data: "Taleplerim",
              ),
            ],
          ),
          Row(
            children: [
              RequestButtonWidget(
                iconPath: 'assets/User_light.svg',
                data: "Bilgilerim",
              ),
              SizedBox(width: 12),
              RequestButtonWidget(
                iconPath: 'assets/Sign_out_squre_light.svg',
                data: "Çıkış Yap",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
