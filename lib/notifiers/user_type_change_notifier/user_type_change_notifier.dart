import 'package:flutter/foundation.dart';
import 'package:smart_tent_city_app/model/user_type.dart';

class UserTypeChangeNotifier extends ChangeNotifier {
  UserTypeChangeNotifier({this.userType});
  UserType? userType;
  void change(UserType? userType) {
    this.userType = userType;
    notifyListeners();
  }
}
