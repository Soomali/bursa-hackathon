import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppBarProvider {
  static AppBar getStatusBarAppBar() {
    return AppBar(
      toolbarHeight: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.redAccent.shade700.withOpacity(.6),
          statusBarColor: Colors.red.shade700.withOpacity(.8)),
    );
  }
}
