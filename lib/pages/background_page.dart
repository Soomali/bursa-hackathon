import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BackgroundPage extends StatelessWidget {
  final Widget? fab;
  BackgroundPage({required this.child, this.fab, Key? key}) : super(key: key);
  final Widget child;

  /*List<MainPageButtonData> liste=[
    MainPageButtonData(iconPath: "assets/Chat_plus.svg", textData: "textData", onPress: (){}),
    MainPageButtonData(iconPath: "assets/Chat_plus.svg", textData: "textData", onPress: (){}),
    MainPageButtonData(iconPath: "assets/Chat_plus.svg", textData: "textData", onPress: (){}),
    MainPageButtonData(iconPath: "assets/Chat_plus.svg", textData: "textData", onPress: (){}),
    MainPageButtonData(iconPath: "assets/Chat_plus.svg", textData: "textData", onPress: (){}),
    MainPageButtonData(iconPath: "assets/Chat_plus.svg", textData: "textData", onPress: (){}),
    MainPageButtonData(iconPath: "assets/Chat_plus.svg", textData: "textData", onPress: (){}),
  ];*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
            systemNavigationBarColor: Colors.redAccent.shade700,
            statusBarColor: Colors.red.shade700),
      ),
      floatingActionButton: fab,
      // appBar: AppBar(
      //   toolbarHeight: 60,
      //   backgroundColor: Colors.redAccent.shade700,
      //   title: Text(
      //     "Akıllı Çadır Kent",
      //     style: TextStyle(color: Colors.white),
      //   ),
      // ),
      body: SafeArea(
        child: child, //büşranın sayfa değiştirme bölümü
      ),
    );
  }
}
