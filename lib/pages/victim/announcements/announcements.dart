import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_tent_city_app/model/user_type.dart';
import 'package:smart_tent_city_app/notifiers/async_change_notifier_state.dart';
import 'package:smart_tent_city_app/notifiers/pagination_change_notifier/announcement_list_change_notifier.dart';
import 'package:smart_tent_city_app/notifiers/victim_change_notifier.dart/victim_change_notifier.dart';
import 'package:smart_tent_city_app/pages/request/request_page.dart';
import 'package:smart_tent_city_app/pages/victim/announcements/announcement_card.dart';

class AnnouncementPage extends StatelessWidget {
  const AnnouncementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return UserDataProviderWidget(
        userType: UserType.victim,
        child: Builder(builder: (context) {
          String tentCityId =
              Provider.of<VictimChangeNotifier>(context, listen: false)
                  .data!
                  .tentCityId;
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            Provider.of<AnnouncementListChangeNotifier>(context, listen: false)
                .get(tentCityId);
          });
          return Consumer<AnnouncementListChangeNotifier>(
            builder: (context, notifier, child) {
              if ((notifier.data == null || notifier.data!.isEmpty) &&
                  notifier.state == AsyncChangeNotifierState.busy) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (notifier.data == null || notifier.data!.isEmpty) {
                return Center(child: Text('Sonuç Bulunamadı'));
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Duyurular',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Divider(
                      color: Colors.black,
                      thickness: 4,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.all(8),
                      itemBuilder: (context, index) => AnnouncementCard(
                        model: notifier.data![index],
                      ),
                      itemCount: notifier.data!.length,
                    ),
                  ),
                ],
              );
            },
          );
        }));
  }
}
