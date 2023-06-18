import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_tent_city_app/pages/my_feedbacks/my_feedbacks_page.dart';
import 'package:smart_tent_city_app/pages/victim/my_requests/my_requests_page.dart';

class RequestsFeedbackPage extends StatefulWidget {
  const RequestsFeedbackPage({super.key});

  @override
  State<RequestsFeedbackPage> createState() => _RequestsFeedbackPageState();
}

class _RequestsFeedbackPageState extends State<RequestsFeedbackPage> {
  int _selectedIndex = 0;
  List<Widget> widgets = [MyRequestsPage(), MyFeedbacksPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgets[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
              label: 'Taleplerim',
              icon: SvgPicture.asset(
                'assets/Bag.svg',
                color: _selectedIndex == 0
                    ? Colors.redAccent.shade700
                    : Colors.grey.shade800,
              )),
          BottomNavigationBarItem(
              label: 'Dileklerim',
              icon: SvgPicture.asset('assets/complaint.svg',
                  color: _selectedIndex == 1
                      ? Colors.redAccent.shade700
                      : Colors.grey.shade800)),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
