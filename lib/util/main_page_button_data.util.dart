import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_tent_city_app/data/main_page_button_data/main_page_button_data.dart';
import 'package:smart_tent_city_app/model/user_type.dart';
import 'package:smart_tent_city_app/pages/onboarding/onboarding_page.dart';

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
            print('GO TO REQUESTS PAGE');
          }),
      MainPageButtonData(
          iconPath: 'assets/Home_light.svg',
          textData: 'Depremzede İşlemleri',
          onPress: () {
            print('GO TO REQUESTS PAGE');
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
            print('GO TO REQUESTS PAGE');
          }),
      MainPageButtonData(
          iconPath: 'assets/Chat_search.svg',
          textData: 'İstek ve Şikayetler',
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

  static List<MainPageButtonData> _getVictimButtonData(BuildContext context) {
    return [
      MainPageButtonData(
          iconPath: 'assets/Chat_plus.svg',
          textData: 'Talep Oluştur',
          onPress: () {
            print('GO TO REQUESTS PAGE');
          }),
      MainPageButtonData(
          iconPath: 'assets/Message_light.svg',
          textData: 'Taleplerim',
          onPress: () {
            print('GO TO REQUESTS PAGE');
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
            print('GO TO REQUESTS PAGE');
          }),
    ];
  }
}
