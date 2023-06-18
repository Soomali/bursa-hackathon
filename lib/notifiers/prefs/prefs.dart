import 'package:shared_preferences/shared_preferences.dart';

import '../../model/user_type.dart';

class LocalStorage {
  Future<String?> getPhoneNumber() async {
    final instance = await SharedPreferences.getInstance();
    return instance.getString('phoneNumber');
  }

  void setPhoneNumber(String phoneNumber) async {
    final instance = await SharedPreferences.getInstance();
    instance.setString('phoneNumber', phoneNumber);
  }

  void setUserType(UserType userType) async {
    final instance = await SharedPreferences.getInstance();
    instance.setString('userType', userType.name);
  }

  void removeUserType() async {
    final instance = await SharedPreferences.getInstance();
    instance.remove('userType');
  }

  Future<UserType?> getUserType() async {
    final instance = await SharedPreferences.getInstance();
    final value = instance.get('userType');
    if (value == null) {
      return null;
    }
    return value == UserType.executive.name
        ? UserType.executive
        : UserType.victim;
  }
}
