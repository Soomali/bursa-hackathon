import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_tent_city_app/pages/components/NavigationBar.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 7), () {
      // Splash screen süresi (3 saniye) sonunda ana ekrana yönlendirme işlemleri burada yapılabilir
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => NavigationBarPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          'assets/animation/Sticker_12_HumansHelping.json', // Lottie animasyon dosyasının yolu
          repeat: false, // Animasyonun tekrarlanması
          reverse: false, // Animasyonun ters çalması
          animate: true, // Animasyonun oynatılması
          width: 300, // Animasyon genişliği
          height: 300, // Animasyon yüksekliği
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Text('Welcome to the app!'),
      ),
    );
  }
}
