import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:smart_tent_city_app/model/user_type.dart';
import 'package:smart_tent_city_app/notifiers/user_type_change_notifier/user_type_change_notifier.dart';
import 'package:smart_tent_city_app/pages/background_page.dart';
import 'package:smart_tent_city_app/pages/main_page/request_button_widget.dart';
import 'package:smart_tent_city_app/data/main_page_button_data/main_page_button_data.dart';
import 'package:smart_tent_city_app/util/main_page_button_data.util.dart';



class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final type =
        Provider.of<UserTypeChangeNotifier>(context, listen: false).userType ??
            UserType.victim;
    List<MainPageButtonData> list =
        MainPageButtonDataUtil.getButtonDataByUserType(
      context,
      type,
    );
    return BackgroundPage(
      child: Center(
        child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: list
                .map((buttonData) {
                  return RequestButtonWidget(buttonData: buttonData);
                })
                .toList()
                .cast<Widget>(),
          ),
        ),
      ),
    );
  }
}
