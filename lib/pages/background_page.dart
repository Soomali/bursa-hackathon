import 'package:flutter/material.dart';

class BackgroundPage extends StatelessWidget {
  const BackgroundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.redAccent.shade700, // Arkaplan rengini beyaz yap
        title: Text(
          "Akıllı Çadır Kent",
          style: TextStyle(color: Colors.white), // Yazı rengini kırmızı yap
        ),
      ),
      body: SafeArea(
        child: Container(), //büşranın sayfa değiştirme bölümü
      ),
    );
  }
}

