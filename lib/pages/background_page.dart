import 'package:flutter/material.dart';

class BackgroundPage extends StatelessWidget {
  BackgroundPage({required this.child, Key? key}) : super(key: key);
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
        toolbarHeight: 60,
        backgroundColor: Colors.redAccent.shade700,
        title: Text(
          "Akıllı Çadır Kent",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: child, //büşranın sayfa değiştirme bölümü
      ),
    );
  }
}
