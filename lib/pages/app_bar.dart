import 'package:flutter/material.dart';

class AppBarWidget{
  static AppBar buildAppBar() {
    return AppBar(
      toolbarHeight: 60,
      backgroundColor: Colors.redAccent.shade700, // Arkaplan rengini beyaz yap
      title: Text(
        "Akıllı Çadır Kent",
      style: TextStyle(color: Colors.white), // Yazı rengini kırmızı yap
      ),
    );
  }
}