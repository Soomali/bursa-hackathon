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
            systemNavigationBarColor: Colors.redAccent.shade700.withOpacity(.6),
            statusBarColor: Colors.red.shade700.withOpacity(.8)),
      ),
      floatingActionButton: fab,
      body: SafeArea(
        child: child, //büşranın sayfa değiştirme bölümü
      ),
    );
  }
}
