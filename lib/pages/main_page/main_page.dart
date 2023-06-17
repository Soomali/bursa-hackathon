import 'package:flutter/cupertino.dart';
import 'package:smart_tent_city_app/pages/background_page.dart';
import 'package:smart_tent_city_app/pages/main_page/request_button_widget.dart';
import 'package:smart_tent_city_app/data/main_page_button_data/main_page_button_data.dart';

class MainPage extends StatelessWidget {
  final List<MainPageButtonData> list;
  const MainPage({required this.list, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
