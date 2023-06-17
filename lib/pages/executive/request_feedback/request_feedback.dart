import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_tent_city_app/pages/executive/feedbacks/feedback_page.dart';
import 'package:smart_tent_city_app/pages/executive/tent_city_requests/tent_city_requests_body.dart';

class RequestFeedback extends StatefulWidget {
  const RequestFeedback({super.key});

  @override
  State<RequestFeedback> createState() => _RequestFeedbackState();
}

class _RequestFeedbackState extends State<RequestFeedback> {
  late List<Widget> widgets = [TentCityRequests(), FeedbackPage()];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                label: 'Talepler',
                icon: SvgPicture.asset(
                  'assets/Bag.svg',
                  color: _selectedIndex == 0
                      ? Colors.redAccent.shade700
                      : Colors.black,
                )),
            BottomNavigationBarItem(
                label: 'Dilekler',
                icon: SvgPicture.asset(
                  'assets/complaint.svg',
                  color: _selectedIndex == 1
                      ? Colors.redAccent.shade700
                      : Colors.black,
                )),
          ]),
      body: this.widgets[_selectedIndex],
    );
  }
}
