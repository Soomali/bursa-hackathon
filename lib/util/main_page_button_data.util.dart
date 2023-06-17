import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_tent_city_app/data/main_page_button_data/main_page_button_data.dart';
import 'package:smart_tent_city_app/model/user_type.dart';
import 'package:smart_tent_city_app/pages/executive/executive_data/executive_data.dart';
import 'package:smart_tent_city_app/pages/executive/feedbacks/feedback_page.dart';
import 'package:smart_tent_city_app/pages/victim/my_requests/my_requests_page.dart';
import 'package:smart_tent_city_app/pages/onboarding/onboarding_page.dart';
import 'package:smart_tent_city_app/pages/victim/qr_page/qr_page.dart';
import 'package:smart_tent_city_app/pages/victim/request_choice/request_choice.dart';
import 'package:smart_tent_city_app/pages/executive/tent_city_requests/tent_city_requests_body.dart';
import 'package:smart_tent_city_app/pages/executive/victim_processes/victim_processes_page.dart';

class MainPageButtonDataUtil {
  static List<MainPageButtonData> getButtonDataByUserType(
      BuildContext context, UserType userType) {
    if (userType == UserType.executive) {
      return _getExecutiveButtonData(context);
    }
    return _getVictimButtonData(context);
  }

  static List<MainPageButtonData> _getExecutiveButtonData(
      BuildContext context) {
    return [
      MainPageButtonData(
          iconPath: 'assets/Chat_search.svg',
          textData: 'Talepleri Görüntüle',
          onPress: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => TentCityRequests()));
          }),
      MainPageButtonData(
          iconPath: 'assets/Home_light.svg',
          textData: 'Depremzede İşlemleri',
          onPress: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => VictimProcesses()));
          }),
      MainPageButtonData(
          iconPath: 'assets/inventory.svg',
          textData: 'Envanter Yönetimi',
          onPress: () {
            print('GO TO REQUESTS PAGE');
          }),
      MainPageButtonData(
          iconPath: 'assets/User_light.svg',
          textData: 'bilgilerim',
          onPress: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ExecutiveInfoPage()));
          }),
      MainPageButtonData(
          iconPath: 'assets/Chat_search.svg',
          textData: 'İstek ve Şikayetler',
          onPress: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => FeedbackPage()));
          }),
      MainPageButtonData(
          iconPath: 'assets/Sign_out_squre_light.svg',
          textData: 'Çıkış Yap',
          onPress: () {
            FirebaseAuth.instance.signOut();
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => OnboardingPage()),
                (route) => false);
          }),
    ];
  }

  static List<MainPageButtonData> _getVictimButtonData(BuildContext context) {
    return [
      MainPageButtonData(
          iconPath: 'assets/Chat_plus.svg',
          textData: 'Talep Oluştur',
          onPress: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => RequestChoicePage()));
          }),
      MainPageButtonData(
          iconPath: 'assets/Chat_plus.svg',
          textData: 'QRım',
          onPress: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => QrPage()));
          }),
      MainPageButtonData(
          iconPath: 'assets/Message_light.svg',
          textData: 'Taleplerim',
          onPress: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => MyRequestsPage()));
          }),
      MainPageButtonData(
          iconPath: 'assets/User_light.svg',
          textData: 'bilgilerim',
          onPress: () {
            print('GO TO REQUESTS PAGE');
          }),
      MainPageButtonData(
          iconPath: 'assets/Sign_out_squre_light.svg',
          textData: 'Çıkış Yap',
          onPress: () {
            FirebaseAuth.instance.signOut();
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => OnboardingPage()),
                (route) => false);
          }),
    ];
  }
}
